using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PHARMACY
{
    class DBHandler
    {

        public static MySqlConnection CreateConnection()
        {
            try
            {
                String db = "server=127.0.0.1; uid=root; pwd=root; database=pms;CharSet=utf8;";
                MySqlConnection con = new MySqlConnection(db);

                return con;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return null;
            }
        }
    }
}
