using System;
using ZCS.Models;
namespace ZCS
{
    public partial class login : System.Web.UI.Page
    {
        coreClass coreClass;
        userFields users;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                lblMsg.Text = "";
            }
        }
        #region LoginCall
        private void LoginCall(userFields usersData)
        {
            usersData.Username = uname.Value.ToString().Replace(" ","").Replace("'", "");
            usersData.Password = pwd.Value.ToString().Replace(" ", "").Replace("'", "");
            coreClass = new coreClass();
            usersData = coreClass.CheckLogin(usersData);
            if (usersData.BoolPropery == 1)
            {
                Session["username_ZCS"] = usersData.UserId;
                Response.Redirect("Member/index.html");
            }
            else if (usersData.BoolPropery == 2)
            {
                lblMsg.Text = "Your Account was Deactivated,Please Contact Admin.";
            }
            else if(usersData.BoolPropery == 0)
            {
                lblMsg.Text = "Invalid Credentials";
            }
        }
        #endregion

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            users = new userFields();
            LoginCall(users);
        }
    }
}