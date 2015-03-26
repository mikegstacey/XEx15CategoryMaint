<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 15: Category Maintenance</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #form1 {
            height: 446px;
        }
    </style>
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <h1>Category Maintenance</h1>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="CategoryID" 
            DataSourceID="SqlDataSource1" ForeColor="Black" 
            OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                    ReadOnly="True" SortExpression="CategoryID" >
                </asp:BoundField>
                <asp:BoundField DataField="ShortName" HeaderText="ShortName" SortExpression="ShortName" />
                <asp:BoundField DataField="LongName" HeaderText="LongName" SortExpression="LongName" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
            <EditRowStyle BackColor="#F46D11" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [CategoryID], [ShortName], [LongName] 
                FROM [Categories]" 
            DeleteCommand="DELETE FROM [Categories] 
                WHERE [CategoryID] = @original_CategoryID 
                  AND [ShortName] = @original_ShortName 
                  AND [LongName] = @original_LongName" 
            InsertCommand="INSERT INTO [Categories] 
                ([CategoryID], [ShortName], [LongName]) 
                VALUES (@CategoryID, @ShortName, @LongName)" 
            UpdateCommand="UPDATE [Categories] 
                  SET [ShortName] = @ShortName, 
                      [LongName] = @LongName 
                WHERE [CategoryID] = @original_CategoryID 
                  AND [ShortName] = @original_ShortName 
                  AND [LongName] = @original_LongName">
            <DeleteParameters>
                <asp:Parameter Name="original_CategoryID" Type="String" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_LongName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
                <asp:Parameter Name="original_CategoryID" Type="String" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_LongName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p> <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
            
        </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            HeaderText="Please correct the following errors:" 
            ValidationGroup="Edit" CssClass="error" />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="300px">
            <Fields>
                <asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCategoryID" runat="server" Height="32px" Width="174px" ValidationGroup="purple"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="No data" ControlToValidate="txtCategoryID" Display="Dynamic" ForeColor="White" ValidationGroup="blue">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="no data" ControlToValidate="txtCategoryID" Display="Dynamic" ForeColor="White" Operator="NotEqual" ValidationGroup="blue" ValueToCompare="&quot; &quot;">*</asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ShortName" SortExpression="ShortName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtShortName" runat="server" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtShortName" runat="server" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtShortName" Display="Dynamic" ErrorMessage="can use nulls" ForeColor="White" ValidationGroup="purple">*</asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtShortName" Display="Dynamic" ErrorMessage="can not use nulls" Operator="NotEqual" ValidationGroup="purple" ValueToCompare="&quot; &quot;">*</asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LongName" SortExpression="LongName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LongName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtLongName" runat="server" Text='<%# Bind("LongName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LongName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
            </Fields>
        </asp:DetailsView>
    </form>
    </section>
</body>
</html>
