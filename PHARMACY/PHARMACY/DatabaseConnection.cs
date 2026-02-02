using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySqlConnector;

namespace PHARMACY
{
    class DatabaseConnection
    {

        public DatabaseConnection() {
            connection();
        }
        public static void connection() { 
         string db = "server=127.0.0.1; uid=root; pwd=root; database=pms;CharSet=utf8;";
        MySqlConnection con = new MySqlConnection(db);
       
        }

    }
}
