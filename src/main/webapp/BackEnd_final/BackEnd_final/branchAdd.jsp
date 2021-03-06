<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>分部添加页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7G4mrGoAKdfGRAGUNx8Wb1WhoVr0XkiV"></script>
		<style>
			.layui-card {margin: 35px 45px 45px 0; text-align: center; border-radius: 10px;}
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			#l-map {width: 100%;height: 400px;margin:0;font-family:"微软雅黑"}
			
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                  
                var height = getComputedStyle(window.parent.document.getElementsByClassName("layui-body")[0],null).height;
                console.log(height); 
                obj.height = height;

            } 
        </script>
	</head>

	<body class="layui-layout-body" 
		style="font-family: '宋体'; background-color: #F8F8FF;" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin">
			

				<!-- 内容主体区域 -->
			  <div style="background-color: white; 
			  	margin: 0px 50px 0px 0px; background-color: #F8F8FF;">
			  	<div class="layui-col-md6">
			  	  <div class="layui-row">
			  	  	<div class="layui-collapse">
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">分部名称</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="height: 50px; line-height: 50px;">
									<input class="layui-input" type="text" id="branch_name"/>
								</div>
							</div>
						</div>
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">分部电话</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="text-align: left;">
									<input class="layui-input" type="text" id="branch_tel"/>
								</div>
							</div>
						</div>
				  	</div>
				  	<div class="layui-form-item">
						<button class="layui-btn" style="margin: 25% 0 0 36%;" id="insertBranchInfoByQid">
							保存分部信息
						</button>
					</div>	
				  </div>
				</div>
				<div class="layui-col-md6">
			      <div class="layui-row">
			      	<div class="layui-collapse">
				      	<div class="layui-col-md12 layui-colla-item">
				        	<div class="layui-card">
								<div class="layui-card-header layui-colla-title">分部地址</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="padding-left: 3%;">
									<div class="layui-input-inline" style="padding-bottom: 10px;">
									     <!-- <input type="tel" name="phone" class="layui-input" id="branch_address"
									      	> --> 
									      	<div id="r-result" >请输入分部地址:
									      	
									      		<input type="text" id="suggestId" size="20" class="layui-input" /></div>
									      		<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
									      
	
									</div><br />
						         	<!-- 地图-->
						         	<div id="l-map"></div>
								</div>
							</div>
				      	</div>
			      	</div>
				  </div>
				</div>		
			  </div>

		</div>
		 
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script>
		//JavaScript代码区域
		layui.use('layer ', function(){
			var layer = layui.layer ;
		});
		layui.use('element', function(){
		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
		});
		</script>
	</body>
	<script type="text/javascript">
		/*	// 百度地图API功能
			var map = new BMap.Map("allmap");    // 创建Map实例
			var new_point = new BMap.Point(123.445967,41.711486);
			map.centerAndZoom(new_point, 18);  // 初始化地图,设置中心点坐标和地图级别
			//添加地图类型控件
			map.addControl(new BMap.MapTypeControl({
				mapTypes:[
		            BMAP_NORMAL_MAP,
		            BMAP_HYBRID_MAP
		        ]}));	  
			map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
			map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
			var marker = new BMap.Marker(new_point);  // 创建标注
			map.addOverlay(marker);              // 将标注添加到地图中
			map.panTo(new_point); 
			
			var longitude;
			var latitude;
			map.addEventListener("click",function(e){
				alert("获取位置坐标为："+e.point.lng+" ,"+e.point.lat);
				longitude = e.point.lng;
				latitude = e.point.lat;
			});*/
		</script>
		<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>
		
			<script type="text/javascript">
			// 百度地图API功能
			function G(id) {
				return document.getElementById(id);
			}
		
			var map = new BMap.Map("l-map");
			map.centerAndZoom("北京",12);                   // 初始化地图,设置城市和地图级别。
		
			map.addEventListener("click",function(e){
				alert(e.point.lng+","+e.point.lat);
				longitude = e.point.lng;
				latitude = e.point.lat;
			})
			
			var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
				{"input" : "suggestId"
				,"location" : map
			});
		
			ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
			var str = "";
				var _value = e.fromitem.value;
				var value = "";
				if (e.fromitem.index > -1) {
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
				
				value = "";
				if (e.toitem.index > -1) {
					_value = e.toitem.value;
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
				G("searchResultPanel").innerHTML = str;
			});
		
			var myValue;
			ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
			var _value = e.item.value;
				myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
				
				setPlace();
			});
		
			function setPlace(){
				map.clearOverlays();    //清除地图上所有覆盖物
				function myFun(){
					var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
					longitude = pp.lng;
					latitude = pp.lat;
					map.centerAndZoom(pp, 18);
					map.addOverlay(new BMap.Marker(pp));    //添加标注
				}
				var local = new BMap.LocalSearch(map, { //智能搜索
				  onSearchComplete: myFun
				});
				local.search(myValue);
			}
		</script>		
		
		<script>
			$("#insertBranchInfoByQid").click(function(){
				var branch = $("#branch_name").val();
				var tel = $("#branch_tel").val();
				var address = $("#suggestId").val();
				if(branch==""){
					alert("请输入分部名称");
				}
				else{
					if(tel==""){
						alert("请输入分部电话");
					}else{
						if(address==""){
							alert("请输入分部地址");
						}else{
							if(longitude==null||latitude==null){
								alert("请点击地图获取具体位置");
							}else{
								
								$.ajax({
									url:"<%=request.getContextPath()%>/BackEnd/Handler_insertBranchByQid",
									type:"post",
									data:{
										branch:branch,
										address:address,
										tel:tel,
										longitude:longitude,
										latitude:latitude
									},
									dataType:"json",
									success:function(data){
										alert(data.result);
									}
								});
								
							}
						}
					}
				}
			})
		</script>
		
	
</html>
