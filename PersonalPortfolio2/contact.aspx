
<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "mp"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC sp_ins_visitor @nameTextBox,@emailTextBox, @msgTextBox", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Matthew Pugel -->
<head runat="server"
>
	<title>Matthew Pugel's Personal Portfolio</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet"  href="css/about.css"/>
        <link rel="stylesheet" href="css/contact.css" />
	<link rel="stylesheet" href="css/animate.css"/>
	<script src="port_formsubmit.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
</head>
<body>
	<header>
		<div class="formRow">
	<nav>
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="about.html">About Me</a></li>
			<li><a href="hobbies.html">Hobbies</a></li>
			<li><a href="contact.aspx">Contact Me</a></li>
            
			
		</ul>	
	</nav>
	</div>
        </header>
	<main><!-- Start Form -->

      <form class="form-contact" runat="server">
         <asp:TextBox ID="name" runat="server" />
         <asp:TextBox ID="email" runat="server" />
         <asp:TextBox ID="message" runat="server" Height="100px" Width="200px" />
         <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
          <br />
          <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
      </form>
	</main>
	<footer>
		<p>College: College of Western Idaho</p><br>
		<a href="mailto:CrimsonShade980@hotmail.com">Send me an email</a>
		<p>Phone Number:<a class="mobile" href="tel:2084406329">(208)-440-6329</a></p>
	
			<div class="social">
			<p>Connect with me:</p>
			<a href="https://www.linkedin.com/" target="blank"><img src="images/linkedin.png" alt="LinkedIn"></a>
			<a href="https://twitter.com/Shade9800" target="blank"><img src="images/twitterlogo.png" alt="Twittter"></a>
			<a href="https://www.godaddy.com/" target="blank"><img src="images/GoDaddy.png" alt="GoDaddy"></a>
		</div>
	</footer>
</body>
</html>