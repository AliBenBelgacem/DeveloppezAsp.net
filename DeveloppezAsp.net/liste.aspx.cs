using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class liste : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection MyConnexion = null;
        try
        {
            //Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\Users\bba\Source\repos\DeveloppezAsp.net\DeveloppezAsp.net\App_Data\Database1.mdf;Integrated Security=True
            MyConnexion = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" +
                                                                 "AttachDbFilename=|DataDirectory|\\Database1.mdf;" +
                                                                 "Integrated Security=True;");

            SqlCommand MyCommand = new SqlCommand("SELECT * FROM LISTECOURSES", MyConnexion);
            MyConnexion.Open();

            SqlDataReader MyReader = MyCommand.ExecuteReader();

            DataGrid.DataSource = MyReader;

            DataGrid.DataBind();

            //if (MyReader.HasRows)

            //    while (MyReader.Read())
            //    {
            //        TableRow MyRow = new TableRow();
            //        TableCell MyCellId = new TableCell();
            //        TableCell MyCellLibelle = new TableCell();
            //        TableCell MyCellQuantite = new TableCell();

            //        MyCellId.Text = MyReader.GetInt32(0).ToString();
            //        MyCellLibelle.Text = MyReader.GetString(1);
            //        MyCellQuantite.HorizontalAlign = HorizontalAlign.Right;
            //        MyCellQuantite.Text = MyReader.GetInt32(2).ToString();

            //        MyRow.Cells.Add(MyCellId);
            //        MyRow.Cells.Add(MyCellLibelle);
            //        MyRow.Cells.Add(MyCellQuantite);
            //        Table.Rows.Add(MyRow);
            //    }
            //else
            //    Erreur.Text = "Pas de lignes de résultat";
            
        }
        catch (Exception MyException)
        {
            Erreur.Text = MyException.Message;
        }
        finally
        {
            if (MyConnexion != null)
            {
                if (MyConnexion.State == ConnectionState.Open)
                    MyConnexion.Close();
            }
        }

    }
}