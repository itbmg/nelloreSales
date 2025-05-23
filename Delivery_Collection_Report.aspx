﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Delivery_Collection_Report.aspx.cs" Inherits="Delivery_Collection_Report"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Css/VyshnaviStyles.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <style>
        .HeaderStyle
        {
            border: solid 1px White;
            background-color: #81BEF7;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function CallPrint(strid) {
            var divToPrint = document.getElementById(strid);
            var newWin = window.open('', 'Print-Window', 'width=400,height=400,top=100,left=100');
            newWin.document.open();
            newWin.document.write('<html><body   onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            newWin.document.close();
        }
        function OrderValidate() {
            var fromDate = document.getElementById('<%=txtdate.ClientID %>').value;
            if (fromDate == "") {
                alert("Select Date");
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        $(function () {
            window.history.forward(1);

        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600">
    </asp:ToolkitScriptManager>
    <div>
        <asp:UpdateProgress ID="updateProgress1" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0;
                    right: 0; left: 0; z-index: 9999; background-color: #FFFFFF; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="thumbnails/301.gif" Style="padding: 10px;
                        position: absolute; top: 40%; left: 40%; z-index: 99999;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <section class="content-header">
        <h1>
            Net Sales Report<small>Preview</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Operations</a></li>
            <li><a href="#">Net Sales Report</a></li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">
                    <i style="padding-right: 5px;" class="fa fa-cog"></i>Net Sales Report Details
                </h3>
            </div>
            <div class="box-body">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                 <td>
                                    <asp:Label ID="labeltype" runat="server">AgentWise</asp:Label>
                                     </td>
                                <td>
                                <asp:CheckBox ID="chkReport" runat="server" CssClass="form-control" AutoPostBack="True"></asp:CheckBox>
                                </td>
                                 <td style="width: 5px;">
                                </td>
                                <td>
                                    <asp:Panel ID="PPlant" runat="server" Visible="false">
                                        <asp:DropDownList ID="ddlPlant" runat="server" CssClass="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlPlant_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                </td>
                                <td style="width: 5px;">
                                </td>
                                <td>
                                    <asp:Panel ID="PBranch" runat="server">
                                        <asp:DropDownList ID="ddlSalesOffice" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:Label ID="lblctxtdat" runat="server">Date:</asp:Label>
                                </td>
                                <td style="width: 5px;">
                                </td>
                                <td>
                                    <asp:TextBox ID="txtdate" runat="server" Width="205px" CssClass="form-control"></asp:TextBox>
                                    <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtdate" Format="dd-MM-yyyy HH:mm">
                                    </asp:CalendarExtender>
                                </td>
                                 <td style="width: 5px;">
                                </td>
                                <td>
                                    <asp:Button ID="btnGenerate" Text="Generate" runat="server" OnClientClick="OrderValidate();"
                                        CssClass="btn btn-primary" OnClick="btnGenerate_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlHide" runat="server" Visible="false">
                            <div id="divPrint">
                                <div align="center">
                                    <div style="width: 100%;">
                                        <div style="width: 11%; float: left;">
                                            <img src="Images/Vyshnavilogo.png" alt="SAI ENTERPRISES" width="95px" height="90px" />
                                        </div>
                                        <div style="left: 0%; text-align: center;">
                                            <asp:Label ID="lblTitle" runat="server" Font-Bold="true" Font-Size="26px" ForeColor="#0252aa"
                                                Text=""></asp:Label>
                                            <br />
                                        </div>
                                        <div align="center">
                                            <span style="font-size: 18px; text-decoration: underline; color: #0252aa;">NET SALES
                                                REPORT</span>
                                        </div>
                                        <div style="width: 100%;">
                                            <br />
                                            <div>
                                                <div style="width: 40%; float: left; padding-left: 4%;">
                                                    <span style="color: #0252aa; margin-right: 4%; font-size: 14px;">Date: </span>
                                                    <asp:Label ID="lblDate" runat="server" ForeColor="Red" Font-Size="14px" Text=""></asp:Label>
                                                </div>
                                                <span style="color: #0252aa; font-size: 14px; margin-right: 4%;">SALES OFFICE NAME:
                                                </span>
                                                <asp:Label ID="lblDispatchName" runat="server" ForeColor="Red" Font-Size="14px" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="grdReports" runat="server" ForeColor="White" Width="100%"   CssClass="gridcls"
                                    GridLines="Both" Font-Bold="true" Font-Size="Smaller"  OnRowDataBound="grdReports_RowDataBound">
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="Gray" Font-Bold="False" ForeColor="White" />
                                    <HeaderStyle BackColor="#f4f4f4" Font-Bold="False" ForeColor="Black" Font-Italic="False"
                                        Font-Names="Raavi" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#ffffff" ForeColor="#333333" HorizontalAlign="Center" />
                                    <AlternatingRowStyle HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" />
                                </asp:GridView>
                                <br />
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 30%;">
                                            <span style="font-weight: bold; font-size: 14px;">ACCOUNTS DEPARTMENT</span>
                                        </td>
                                        <td style="width: 30%;">
                                            <span style="font-weight: bold; font-size: 14px;">MANAGER</span>
                                        </td>
                                        <td style="width: 30%;">
                                            <span style="font-weight: bold; font-size: 14px;">MARKETING EXECUTIVE</span>
                                        </td>
                                        <td style="width: 30%;">
                                            <span style="font-weight: bold; font-size: 14px;">DISPATCHER</span>
                                            <asp:Label ID="lblpreparedby" runat="server" Font-Size="Large" ForeColor="Red" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <asp:Button ID="btnPrint" CssClass="btn btn-primary" Text="Print" OnClientClick="javascript:CallPrint('divPrint');"
                                    runat="Server" />
                                <br />
                                <br />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Panel ID="pnlExcel" runat="server" Visible="false">
                    <asp:Button ID="Button3" Text="Export To Excel" runat="server" CssClass="btn btn-primary"
                        OnClick="btn_Export_Click" />
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:Panel ID="pnlSms" runat="server" Visible="false">
                            <asp:TextBox ID="txtMobNo" runat="server" Width="200px" CssClass="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                            <asp:Button ID="btnSMS" Text="Send SMS" runat="server" CssClass="btn btn-primary"
                                OnClick="btnSMS_Click" />
                        </asp:Panel>
                        <br />
                        <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red" Font-Size="20px"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </section>
</asp:Content>
