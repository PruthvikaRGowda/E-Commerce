using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.User
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
                if (!IsPostBack)
                {
                    // Display the cart items if any exist in the session
                    if (Session["cart"] != null)
                    {
                        List<CartItem> cart = (List<CartItem>)Session["cart"];
                        BindCartItems(cart);
                    }
                }

                // Check if we have a product being added to the cart from the URL
                if (Request.QueryString["productId"] != null)
                {
                    AddToCart();
                }
            }

            private void AddToCart()
            {
                // Retrieve product details from query string
                int productId = int.Parse(Request.QueryString["productId"]);
                string productName = Request.QueryString["productName"];
                decimal price = decimal.Parse(Request.QueryString["price"]);

                // Create a new cart item
                CartItem newItem = new CartItem
                {
                    ProductId = productId,
                    ProductName = productName,
                    Price = price,
                    Quantity = 1
                };

                // Add item to cart (session)
                List<CartItem> cart = new List<CartItem>();

                if (Session["cart"] != null)
                {
                    cart = (List<CartItem>)Session["cart"];
                }

                cart.Add(newItem);
                Session["cart"] = cart;

                // Optionally, refresh the page to show updated cart items
                Response.Redirect("Cart.aspx");
            }

            private void BindCartItems(List<CartItem> cart)
            {
                // Loop through the cart items and bind them to the table on the Cart page
                foreach (CartItem item in cart)
                {
                    // Here, you can programmatically create table rows or use a repeater to display cart items
                    // Example:
                    var row = new System.Web.UI.HtmlControls.HtmlTableRow();
                    row.Cells.Add(new System.Web.UI.HtmlControls.HtmlTableCell { InnerText = item.ProductName });
                    row.Cells.Add(new System.Web.UI.HtmlControls.HtmlTableCell { InnerText = "$" + item.Price });
                    row.Cells.Add(new System.Web.UI.HtmlControls.HtmlTableCell { InnerText = item.Quantity.ToString() });
                    row.Cells.Add(new System.Web.UI.HtmlControls.HtmlTableCell { InnerText = "$" + (item.Price * item.Quantity).ToString() });
                    row.Cells.Add(new System.Web.UI.HtmlControls.HtmlTableCell { InnerText = "<button>Remove</button>" });

                    // Add row to cart table (assuming you have a cart table with ID cartTable)
                    cartTable.Rows.Add(row);
                }
            }
        

        public class CartItem
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
        }
    }

}
    