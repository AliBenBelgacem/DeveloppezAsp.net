<%@ Page Language="C#" AutoEventWireup="true" CodeFile="creation.aspx.cs" Inherits="creation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><asp:Literal runat="server" Text="<%$Resources:titre_creation_element_courses %>" /></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="3">
                    <asp:ValidationSummary runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextLibelle" 
                        ForeColor="Red" 
                        Display="Dynamic"
                        ErrorMessage="<%$ Resources:creation_libelle_erreur_obligatoire %>" >*
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label runat="server" Text="<%$ Resources:creation_element_courses_libelle_libelle %>" /> :
                </td>
                <td>
                    <asp:TextBox ID="TextLibelle" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextQuantite" 
                        ForeColor="Red" 
                        Display="Dynamic"
                        ErrorMessage="<%$ Resources:creation_quantite_erreur_obligatoire %>" >*
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="TextQuantite"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationExpression="[0-9]*"
                        ErrorMessage="<%$ Resources:creation_quantite_erreur_numerique %>" >*
                    </asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Label runat="server" Text="<%$ Resources:creation_element_courses_libelle_quantite %>" /> :
                </td>
                <td>
                    <asp:TextBox ID="TextQuantite" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="ButtonValider" runat="server" Text="<%$ Resources:creation_element_courses_libelle_valider %>" OnClick="ButtonValider_Click" />
                </td>
            </tr>
        </table>
    </div>
        <div>
            <asp:Label ID="Erreur" runat="server" Font-Bold="true" ForeColor="Red" />
        </div>
        <div>
            <asp:DataGrid ID="DataGrid" runat="server" BorderWidth="1" GridLines="Both" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundColumn DataField="IDOBJET" HeaderText="<%$ Resources:colonne_identifiant %>" />
                    <asp:BoundColumn DataField="LIBELLE" HeaderText="<%$ Resources:colonne_libelle %>" />
                    <asp:BoundColumn DataField="QUANTITE" HeaderText="<%$ Resources:colonne_quantite %>" ItemStyle-HorizontalAlign="Right" />
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
