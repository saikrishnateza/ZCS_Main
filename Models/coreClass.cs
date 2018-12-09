using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ZCS.Models
{
    public class coreClass
    {
        SqlConnection ZcsCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ZCSConnetion"].ToString());
        SqlCommand cmd;
        SqlDataReader dr;
        #region CheckLogin
        public userFields CheckLogin(userFields userDetails)
        {
            try
            {
                ZcsCon.Open();
                cmd = new SqlCommand("ZCS_LoginCheck", ZcsCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", userDetails.Username);
                cmd.Parameters.AddWithValue("@pwd", userDetails.Password);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    userDetails.BoolPropery = Convert.ToInt16(dr[0]);
                    userDetails.UserId = Convert.ToInt32(dr[1]);
                }
                dr.Close();
            }
            catch (Exception ex) { }
            finally { ZcsCon.Close(); }
            return userDetails;
        }
        #endregion
    }
}