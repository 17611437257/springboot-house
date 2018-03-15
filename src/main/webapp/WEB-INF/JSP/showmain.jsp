<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2018/3/5
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../js/jquery-3.2.1/jquery-3.2.1.js"></script>
    <script src="../js/layui/layui.js"></script>
    <link rel="stylesheet" href="../js/layui/css/layui.css">
</head>
<body class="layui-layout-body ">
<div class="layui-layout layui-layout-admin ">
    <div class="layui-header">
        <div class="layui-logo ">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left  ">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right layui-bg-black">
            <li class="layui-nav-item ">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child ">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side ">
        <div class="layui-side-scroll layui-bg-gray ">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul id="demo" ></ul>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-tab" lay-filter="demo1" lay-allowClose="true">
            <ul class="layui-tab-title" >
                <li class="layui-this">欢迎</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">欢迎来到此页面!</div>
            </div>

        </div>

    </div>

    <div class="layui-footer ">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

</body>
        <script>
            $(function () {
                //查询树表数据
                $.ajax({
                    url:"../tree/queryTree.do",
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        var flag=false;
                        layui.use('tree',function () {
                            layui.tree({
                                elem: '#demo' //传入元素选择器
                                ,click:function (node) {
                                    layui.use('element', function() {
                                        var element = layui.element;
                                        if(node.children==undefined&&flag==false){
                                            element.tabAdd('demo1', {
                                                title: node.name
                                                ,content:createFrame(node.url) //支持传入html
                                                ,id: node.id
                                            });

                                            element.tabChange('demo1',node.id);
                                            /* flag=true;*/
                                        }

                                    })
                                },
                                nodes:data
                            });
                        })

                    }
                })

            })

            function createFrame(href){
                return '<iframe scrolling="auto" frameborder="0"  src="'+ href + '" style="width:100%;height:100%;"></iframe>';
            }


        </script>
</html>
