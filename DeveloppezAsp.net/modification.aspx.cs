using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Charger();
        }
    }
    protected void Charger()
    {
        var Entities = new Database1Entities();
        var Query = from Entity in Entities.LISTECOURSES
                    select Entity;

        DataGrid.DataSource = Query.ToList();
        DataGrid.DataBind();
    }
}