<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="ZCS.login" %>

<!DOCTYPE html>
<html>
<head>

    <title>ZCS Login</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <style type="text/css">
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 15px 0;
            border: none;
            background: #f1f1f1;
        }

        body {
            background-image: url('img/bgimg.jpg');
            background-color: #feffdd;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
        }

        #divMain {
            background-color: #ececec;
            height: 385px;
            background-color: transparent;
        }

        button {
            background-color: #70c996;
            padding: 10px;
            color: white;
            margin: 8px 0;
            border: none;
            width: 100%;
        }

            button:hover {
                opacity: 10;
            }
        /* Extra styles for the cancel button */
        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        /* Center the image and position the close button */
    </style>
    <script type="text/javascript">
        var app = angular.module('ZCS', [])
        {
            app.controller('dgLogin', function ($scope) {
                var showuname, showPwd, placeHolderUname, plcHolderPwd, btnEnable;

                $scope.placeHolderUname = 'Enter User-ID.'
                $scope.plcHolderPwd = 'Enter Password';
                Validate();
                $scope.showuname = false;
                $scope.showPwd = false;

                $scope.btnEnable = false;

                $scope.toggleCustom = function (lbl) {
                    if (lbl == 1) {
                        $scope.showuname = $scope.showuname === true ? false : true;
                    }
                    else if (lbl == 2) {
                        $scope.showPwd = $scope.showPwd === true ? false : true;
                    }
                };

                $scope.Refresh = function () {
                    $('#divMain').fadeIn(1800);
                    history.pushState(null, null, "login.aspx");
                }

                //Username
                $scope.shwUnameE = function () {
                    $scope.toggleCustom(1);
                    if ($scope.placeHolderUname == 'Enter User-ID.') {
                        $scope.placeHolderUname = '';
                    }
                }
                $scope.shwUnameL = function () {
                    $scope.showuname = false;
                    if ($scope.placeHolderUname == '') {
                        $scope.placeHolderUname = 'Enter User-ID.';
                    }
                    Validate();
                }

                //Password
                $scope.shwPwdE = function () {
                    $scope.toggleCustom(2);
                    if ($scope.plcHolderPwd == 'Enter Password') {
                        $scope.plcHolderPwd = '';
                    }
                }
                $scope.shwPwdL = function () {
                    $scope.showPwd = false;
                    if ($scope.plcHolderPwd == '') {
                        $scope.plcHolderPwd = 'Enter Password';
                    }
                    Validate();
                }
            });
            function Validate() {
                if ($('#uname').val() != "" && $('#uname').val() != "Enter User-ID." && $('#pwd').val() != "" && $('#pwd').val() != "Enter Password") {
                    $('#btnLogin').attr('disabled', false);
                }
                else {
                    $('#btnLogin').attr('disabled', true);
                }
            }
        };
    </script>
</head>
<body class="img img-responsive ng-scope" ng-app="ZCS" data-gr-c-s-loaded="true">
    <form method="post" runat="server" id="ctl00" class="ng-pristine ng-valid">
        <div class="container">
            <div class="col-md-12">
                <div class="row ng-scope" ng-controller="dgLogin">
                    <div class="col-md-4">
                        <p style="color: red; margin-top: 270px">
                            <img src="img/logintxt.png" class="img img-responsive" />
                        </p>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12">
                    </div>
                    <div class="col-md-4" id="divMain" style="margin-top: 185px">
                        <h1 align="center" style="font-family: AaronBold">LOGIN</h1>
                        <h3 align="center" style="font-family: AaronBold; color: red">
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        </h3>
                        <label id="lblUname" ng-show="showuname" class="ng-hide"><b>Username</b></label>
                        <input name="uname" type="text" id="uname" runat="server" ng-model="placeHolderUname" ng-focus="shwUnameE()" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-blur="shwUnameL()" />
                        <label ng-show="showPwd" class="ng-hide"><b>Password</b></label>&nbsp; &nbsp;
                       
                        <input name="pwd" type="password" id="pwd" runat="server" ng-model="plcHolderPwd" ng-focus="shwPwdE()" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-blur="shwPwdL()" />
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary form-group" OnClick="btnLogin_Click" Width="345px" Style="font-size: medium" align="center" />
                        <div align="center">
                            <a id="hyplnavF" href="#" style="font-weight: 100; color: black">Forgot password!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>


</body>
</html>
