using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZCS.Models
{
    public class userFields
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string AlternativeNumber { get; set; }
        public string Name { get; set; }
        public int User_Type { get; set; }
        public Char IsUserActive { get; set; }
        public bool IsValidLogin { get; set; }
        public int BoolPropery { get; set; }
        public long UserId { get; set; }
    }
}