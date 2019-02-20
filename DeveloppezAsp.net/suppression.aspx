<%@ Page Language="C#" AutoEventWireup="true" CodeFile="suppression.aspx.cs" Inherits="suppression" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><asp:Literal runat="server" Text="<%$ Resources:titre_suppression_element_courses %>" /></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Erreur" runat="server" Font-Bold="true" ForeColor="Red" />
        </div>
        <div>
            <asp:DataGrid ID="DataGrid" runat="server" BorderWidth="1" GridLines="Both" AutoGenerateColumns="false" OnItemCommand="ItemsGrid_Command" >
                <Columns>
                    <asp:BoundColumn DataField="IDOBJET" HeaderText="<%$ Resources:colonne_identifiant %>" />
                    <asp:BoundColumn DataField="LIBELLE" HeaderText="<%$ Resources:colonne_libelle %>" />
                    <asp:BoundColumn DataField="QUANTITE" HeaderText="<%$ Resources:colonne_quantite %>" ItemStyle-HorizontalAlign="Right" />
                    <asp:ButtonColumn CommandName="Delete" Text="<%$ Resources:suppression_supprimer_libelle %>" />
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>