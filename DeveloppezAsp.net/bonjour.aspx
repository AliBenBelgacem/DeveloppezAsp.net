<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bonjour.aspx.cs" Inherits="bonjour" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:Literal runat="server" Text="<%$ Resources:Resource1, titre_bonjour %>" /></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:Label runat="server" Text="<%$ Resources:Resource1, libelle_bonjour_le_monde %>" />
        </div>
    </form>
</body>
</html>
