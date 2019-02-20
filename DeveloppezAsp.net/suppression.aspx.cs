using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class suppression : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Charger();

    }
    protected void Charger()
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
    public void ItemsGrid_Command(Object sender, DataGridCommandEventArgs e)
    {
        var MyConnexion = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" +
                                                                "AttachDbFilename=|DataDirectory|\\Database1.mdf;" +
                                                                "Integrated Security=True;");
        if (((LinkButton)e.CommandSource).CommandName =="Delete")
        {
            try
            {
                SqlCommand MyCommand = new SqlCommand("SELECT * FROM LISTECOURSES", MyConnexion);

                SqlDataAdapter MyAdapter = new SqlDataAdapter(MyCommand);
                DataTable MyDataTable = new DataTable("LISTECOURSES");
                MyAdapter.Fill(MyDataTable);
                Int32 IdObjet = Convert.ToInt32(e.Item.Cells[0].Text);
                DataRow[] MyDataRows = MyDataTable.Select("IDOBJET = " + IdObjet);
                MyDataRows[0].Delete();
                SqlCommandBuilder MyCommandBuilder = new SqlCommandBuilder(MyAdapter);
                MyAdapter.DeleteCommand = MyCommandBuilder.GetDeleteCommand();
                MyAdapter.Update(MyDataTable);
                DataGrid.DataSource = MyDataTable;
                DataGrid.DataBind();
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
                    {
                        MyConnexion.Close();
                    }
                }

            }
        }
    }


}