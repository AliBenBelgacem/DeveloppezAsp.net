<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modification.aspx.cs" Inherits="modification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><asp:Literal runat="server" Text="<%$ Resources:titre_modification_element_courses %>" /></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ValidationSummary runat="server" ForeColor="Red" />
    </div>
    <div>
        <asp:DataGrid ID="DataGrid" runat="server" BorderWidth="1" GridLines="Both" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundColumn DataField="IDOBJET" HeaderText="<%$ Resources:colonne_identifiant %>" ReadOnly="True" />
                <asp:TemplateColumn HeaderText="<%$ Resources:colonne_libelle %>" >
                    <EditItemTemplate>
                        <asp:TextBox ID="textLibelle" runat="server" Text="<%# Bind('LIBELLE')%>" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textLibelle" 
                            ForeColor="Red" 
                            Display="Dynamic"
                            ErrorMessage="<%$ Resources:modification_libelle_erreur_obligatoire %>" >*
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="labelLibelle" runat="server" Text="<%# Bind('LIBELLE')%>" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="<%$ Resources:colonne_quantite %>" >
                    <EditItemTemplate>
                        <asp:TextBox ID="textQuantite" runat="server" Text="<%# Bind('QUANTITE')%>" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textQuantite" 
                            ForeColor="Red" 
                            Display="Dynamic"
                            ErrorMessage="<%$ Resources:modification_quantite_erreur_obligatoire %>" >*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="textQuantite"
                            ForeColor="Red"
                            Display="Dynamic"
                            ValidationExpression="[0-9]*"
                            ErrorMessage="<%$ Resources:modification_quantite_erreur_numerique %>" >*
                        </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="labelQuantite" runat="server" Text="<%# Bind('QUANTITE')%>" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:EditCommandColumn ButtonType="PushButton"
                    EditText="<%$ Resources:modification_element_courses_libelle_modifier %>"
                    UpdateText="<%$ Resources:modification_element_courses_libelle_valider %>"
                    CancelText="<%$ Resources:modification_element_courses_libelle_annuler %>" />
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
