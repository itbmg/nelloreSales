﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DispatchWiseDcReport.aspx.cs" Inherits="DispatchWiseDcReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Css/VyshnaviStyles.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script language="javascript">
        function CallPrint(strid) {
            var divToPrint = document.getElementById(strid);
            var newWin = window.open('', 'Print-Window', 'width=400,height=400,top=100,left=100');
            newWin.document.open();
            newWin.document.write('<html><body   onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            newWin.document.close();
        }
        function OrderValidate() {
            var fromDate = document.getElementById('<%=txtfromdate.ClientID %>').value;
            if (fromDate == "") {
                alert("Select Date");
                return false;
            }
            var todate = document.getElementById('<%=txttodate.ClientID %>').value;
            if (todate == "") {
                alert("Select To Date");
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600">
    </asp:ToolkitScriptManager>
    <div>
        <asp:UpdateProgress ID="updateProgress1" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0;
                    right: 0; left: 0; z-index: 9999; background-color: #FFFFFF; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="thumbnails/loading.gif"
                        Style="padding: 10px; position: absolute; top: 40%; left: 40%; z-index: 99999;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <section class="content-header">
        <h1>
            Return DC<small>Preview</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Reports</a></li>
            <li><a href="#"><i></i>Despatch</a></li>
            <li><a href="#">Return DC</a></li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">
                    <i style="padding-right: 5px;" class="fa fa-cog"></i>Return DC Details
                </h3>
            </div>
            <div class="box-body">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Panel ID="PBranch" runat="server">
                                        <asp:DropDownList ID="ddlSalesOffice" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                </td>
                                <td style="width:6px;"></td>
                                <td>
                                    <asp:Label ID="Label1" runat="server">Disp Name:</asp:Label>
                                    <asp:DropDownList ID="ddlDispName" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </td>
                                <td style="width:6px;"></td>
                                <td>
                                    <asp:Label ID="lblfromdate" runat="server">From Date:</asp:Label>
                                    <asp:TextBox ID="txtfromdate" runat="server" Width="205px" CssClass="form-control"></asp:TextBox>
                                    <asp:CalendarExtender ID="fromdate_CalendarExtender1" runat="server" Enabled="True"
                                        TargetControlID="txtfromdate" Format="dd-MM-yyyy HH:mm">
                                    </asp:CalendarExtender>
                                </td>
                                <td style="width:6px;"></td>
                                <td>
                                    <asp:Label ID="lbltodate" runat="server">To Date:</asp:Label>
                                    <asp:TextBox ID="txttodate" runat="server" Width="205px" CssClass="form-control"></asp:TextBox>
                                    <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txttodate" Format="dd-MM-yyyy HH:mm">
                                    </asp:CalendarExtender>
                                </td>
                                <td style="width:6px;"></td>
                                <td>
                                    <asp:Button ID="btnGenerate" Text="Generate" runat="server" OnClientClick="OrderValidate();"
                                        CssClass="btn btn-primary" OnClick="btnGenerate_Click"/>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlHide" runat="server" Visible="false">
                            <div id="divPrint">
                                <div style="width: 100%;">
                                    <div style="width: 11%; float: left;">
                                        <img src="Images/Vyshnavilogo.png" alt="SAI ENTERPRISES" width="120px"
                                            height="135px" />
                                    </div>
                                    <div style="left: 0%; text-align: center;">
                                        <asp:Label ID="lblTitle" runat="server" Font-Bold="true" Font-Size="26px" ForeColor="#0252aa"
                                            Text=""></asp:Label>
                                        <br />
                                        <div style="width: 100%;">
                                            <span style="font-size: 18px; font-weight: bold; text-decoration: underline; color: #0252aa;">
                                                Dispatch Wise DC Report</span><br />
                                            <div>
                                            </div>
                                        </div>
                                        <div align="center">
                                            <div>
                                                <div style="width: 40%; float: left; padding-left: 7%;">
                                                    <span style="font-weight: bold;">Agent Name: </span>
                                                    <asp:Label ID="lblDispName" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                </div>
                                                <span style="font-weight: lblDispName;">Date: </span>
                                                <asp:Label ID="lbl_fromDate" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                <span style="font-size: 18px;">TO</span>
                                                <asp:Label ID="lbl_selttodate" runat="server" Text="" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>
                                        <asp:GridView ID="grdtotal_dcReports" runat="server" ForeColor="White" Width="100%"
                                            CssClass="gridcls" GridLines="Both" Font-Bold="true">
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="Gray" Font-Bold="False" ForeColor="White" />
                                            <HeaderStyle BackColor="#f4f4f4" Font-Bold="False" ForeColor="Black" Font-Italic="False"
                                                Font-Names="Raavi" Font-Size="Small" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#ffffff" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btnPrint" CssClass="btn btn-primary" Text="Print" OnClientClick="javascript:CallPrint('divPrint');"
                                runat="Server"  />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/exporttoxl_utility.ashx">Export to XL</asp:HyperLink>
                            Mobile No
                            <asp:TextBox ID="txtMobNo" runat="server" CssClass="form-control"  placeholder="Enter DC No"></asp:TextBox>
                            <asp:Button ID="btnSMS" Text="Send SMS" runat="server" CssClass="btn btn-primary" OnClick="btnSMS_Click" />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red" Font-Size="20px"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </section>
</asp:Content>
