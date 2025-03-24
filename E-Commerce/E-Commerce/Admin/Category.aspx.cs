using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            label_msg.Visible=false;
            if (!IsPostBack)
            {
                getCategories();
            }
        }
        void getCategories()
        {
            try
            {
                con = new SqlConnection(Utils.getConnection()); // Your connection string helper method
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETALL");
                cmd.CommandType = CommandType.StoredProcedure;

                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);  // Fill the DataTable with the result from the database

                if (dt.Rows.Count > 0)
                {
                    rCategory.DataSource = dt;  // Bind the data to Repeater control
                    rCategory.DataBind();
                }
                else
                {
                    label_msg.Text = "No categories found!";
                    label_msg.Visible = true;
                }
            }
            catch (Exception ex)
            {
                label_msg.Text = "Error: " + ex.Message;
                label_msg.Visible = true;
            }
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            String actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int categoryId = Convert.ToInt32(hfCategoryId.Value);
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text.Trim());
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked); 

            if (FuCategoryImage.HasFile)
            {
                if(Utils.isValidExtension(FuCategoryImage.FileName))
                 {
                    string newImageName = Utils.getUniqueId();
                    fileExtension = Path.GetExtension(FuCategoryImage.FileName);
                    imagePath = "Images/Category/" +newImageName.ToString() + fileExtension;
                    FuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + newImageName.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@CategoryImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    label_msg.Visible = false;
                    label_msg.Text = "Please select .jpg, .jpeg or .png image";
                    label_msg.CssClass = "Alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;

            }
            if(isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = categoryId == 0 ? " inserted " : " updated";
                    label_msg.Visible = true;
                    label_msg.Text = "Category " + actionName + " successfully! ";
                    label_msg.CssClass = "Alert alert-success";
                    getCategories();
                    clear();
                }
                catch (Exception ex)
                {
                    label_msg.Visible = true;
                    label_msg.Text = "Error--" +ex.Message;
                    label_msg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        void clear()
        {
            txtCategoryName.Text = string.Empty;
            cbIsActive.Checked = false;
            hfCategoryId.Value = "0";
            btnAddOrUpdate.Text = "Add";
            imagePreview.ImageUrl = string.Empty;
        }
        protected void rCategory_ItemCommand(Object source, RepeaterCommandEventArgs e)
        {
            label_msg.Visible = false;
            if(e.CommandName=="edit")
            {
                con = new SqlConnection(Utils.getConnection()); // Your connection string helper method
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtCategoryName.Text = dt.Rows[0]["CategoryName"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imagePreview.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["CategoryImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["CategoryImageUrl"].ToString();
                imagePreview.Height = 200;
                imagePreview.Width = 200;
                hfCategoryId.Value = dt.Rows[0]["CategoryId"].ToString();
                btnAddOrUpdate.Text = "Update";
            }
            else if (e.CommandName == "delete")
            {
                con = new SqlConnection(Utils.getConnection()); // Your connection string helper method
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();                  
                    label_msg.Visible = true;
                    label_msg.Text = "Category deleted successfully! ";
                    label_msg.CssClass = "Alert alert-success";
                    getCategories();              
                }
                catch (Exception ex)
                {
                    label_msg.Visible = true;
                    label_msg.Text = "Error--" + ex.Message;
                    label_msg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}