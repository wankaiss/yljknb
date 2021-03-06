<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>申诉审核</title>
<%@ include file="../../../pages/pub/pubsource.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/scripts/report.js"></script>
<script type="text/javascript">
	mini.parse();
	var baz032str = [ {
		id : '99',
		text : '全部'
	}, {
		id : '1',
		text : '普通转单病种'
	}, {
		id : '2',
		text : '单病种转普通'
	}, {
		id : '3',
		text : '单病种转单病种'
	} ];
	var baz031str = [ {
		id : '11',
		text : '待申诉'
	}, {
		id : '12',
		text : '待审核'
	}, {
		id : '13',
		text : '放弃申诉'
	}, {
		id : '14',
		text : '申诉过期'
	}, {
		id : '15',
		text : '审核通过'
	}, {
		id : '16',
		text : '审核不通过'
	} ];
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="mainlistCon">
		<div id="layout1" class="mini-layout nobor" allowResize="false"
			style="width: 100%; height: 490px;">
			<div title="center" region="center" style="padding: 5px;">
				<div id="sp1" class="mini-splitter" style="width:100%;height:100%;"
					vertical="true" allowResize="false">
					<div size="15%" showCollapseButton="true">
						<div id="editForm1" class="cxTabbox">
							<form id="form1" action="#" onsubmit="return false;">
								<table class="cxTab" cellpadding="0" cellspacing="0" border="0"
									width="100%">
									<tr>
										<td class="textR">参保人：</td>
										<td>
											<div class="inputL" style="width: 100px">
												<div class="inputR">
													<div class="inputC">
														<input id="aac003" name="aac003" class="mini-textbox"
															emptyText="输入姓名/医保号" />
													</div>
												</div>
											</div>
										</td>
										<td class="textR">审核状态：</td>
										<td>
											<div class="inputL" style="width: 100px">
												<div class="inputR">
													<div class="inputC">
														<input id="baz031" name="baz031" class="mini-combobox"
															popupWidth="150" emptyText="选择审核状态..." data="baz031str" />
													</div>
												</div>
											</div>
										</td>
										<td class="textR">转换类别：</td>
										<td>
											<div class="inputL" style="width: 100px">
												<div class="inputR">
													<div class="inputC">
														<input id="baz032" name="baz032" class="mini-combobox"
															value="99" popupWidth="150" emptyText="选择就诊类别..."
															data="baz032str" />
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="textR">就诊开始时间：</td>
										<td>
											<div class="inputL" style="width:100px">
												<div class="inputR">
													<div class="inputC">
														<input id="akc194Start" name="akc194Start"
															class="mini-datepicker" allowInput="false"
															format="yyyyMMdd" />
													</div>
												</div>
											</div></td>
										<td class="textR">就诊结束时间：</td>
										<td>
											<div class="inputL" style="width:100px">
												<div class="inputR">
													<div class="inputC">
														<input id="akc194End" name="akc194End"
															class="mini-datepicker" allowInput="false"
															format="yyyyMMdd" />
													</div>
												</div>
											</div></td>
										<td style="text-align: center; padding-top: 5px;" colspan="2">
											<input type="button" value="" class="cxsubmit"
											onclick="search();" /> <input type="button" value=""
											class="cxreset" onclick="resetFrom();" />
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div size="85%" showCollapseButton="false">
						<div id="datagrid1" class="mini-datagrid"
							style="width: 100%; height: 100%;" idField="id"
							multiSelect="false" allowResize="false" pageSize="50"
							showColumnsMenu="true" sortMode="client"
							onrowdblclick="queryHistory"
							url="${pageContext.request.contextPath}/k2/f10206001/queryMedDocument.action">
							<div property="columns">
								<div type="indexcolumn"></div>
								<div field="baz011" width="100" headerAlign="center"
									visible="false">违规单据ID</div>
								<div field="aaz370" width="100" headerAlign="center"
									visible="false">就诊编号</div>
								<div field="baz031" type="comboboxcolumn" allowSort="true"
									width="100" headerAlign="center">
									审核状态<input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['BAZ031']}" />
								</div>
								<div field="aac003" width="100" headerAlign="center"
									allowSort="true">参保人姓名</div>
								<div field="aac004" type="comboboxcolumn" width="100"
									visible="false" headerAlign="center">
									参保人性别 <input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AAC004']}" />
								</div>
								<div field="aac006" width="100" headerAlign="center"
									visible="false">参保人出生日期</div>
								<div field="akb020" width="100" headerAlign="center"
									visible="false">机构编号</div>
								<div field="aac001" width="100" headerAlign="center"
									allowSort="true">医保号</div>
								<div field="aac002" width="100" headerAlign="center"
									visible="false">身份证号</div>
								<div field="aka131" type="comboboxcolumn" allowSort="true"
									width="100" headerAlign="center">
									申报结算类型<input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AKA131']}" />
								</div>
								<div field="aka132" type="comboboxcolumn" allowSort="true"
									width="100" headerAlign="center">
									拟转换结算类型<input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AKA132']}" />
								</div>
								<div field="aka133" type="comboboxcolumn" allowSort="true"
									width="100" headerAlign="center">
									二次申报结算类型<input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AKA133']}" />
								</div>
								<div field="aka134" type="comboboxcolumn" allowSort="true"
									width="100" headerAlign="center">
									已转换结算类型<input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AKA134']}" />
								</div>
								<div field="baz022" width="120" headerAlign="center"
									allowSort="true">转换类别</div>
								<div field="aka008" width="120" headerAlign="center"
									allowSort="true">主手术名称</div>
								<div field="zdstr" width="120" headerAlign="center"
									allowSort="true">诊断</div>
								<div field="akc021" type="comboboxcolumn" width="100"
									headerAlign="center">
									人员类别<input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AKC021']}" />
								</div>
								<div field="akc264" width="100" headerAlign="center">费用总额</div>
								<div field="aka130" type="comboboxcolumn" width="100"
									visible="false" headerAlign="center" allowSort="true">
									就诊类型 <input property="editor" class="mini-combobox"
										style="width: 100%" data="${dic['AKA130']}" />
								</div>
								<div field="akb021" width="150" headerAlign="center"
									allowSort="true">医院名称</div>
								<div field="akc190" width="100" headerAlign="center">住院号</div>
								<div field="akc194" width="100" dateFormat="yyyyMMdd"
									allowSort="true" headerAlign="center">就诊时间</div>
								<div field="aae030" width="100" headerAlign="center"
									visible="false">入院时间</div>
								<div field="aae031" width="100" headerAlign="center"
									visible="false">出院时间</div>
								<div field="zysj" width="100" headerAlign="center"
									visible="false">住院天数</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		mini.parse();
		var grid1 = mini.get("datagrid1");
		var detailgrid1_Form = document.getElementById("detailgrid1_Form");
		var queryForm = new mini.Form("form1");
		var layout = mini.get("layout1");
		search();
		function onHospitalSelect(e) {
			var btnEdit = this;
			mini
					.open({
						url : "${pageContext.request.contextPath}/pages/pub/selectHospital_DBZ.jsp",
						title : "医院选择",
						width : 750,
						height : 420,
						onload : function() {
							var iframe = this.getIFrameEl();
							var data = {
								baz031 : '12'
							};
							iframe.contentWindow.SetData(data);
						},
						ondestroy : function(action) {
							if (action == "ok") {
								var iframe = this.getIFrameEl();
								var data = iframe.contentWindow.GetData();
								data = mini.clone(data); //必须
								if (data) {
									var akb021str = "";
									var akb020str = "";
									for ( var i = 0; i < data.length; i++) {
										if ((i + 1) == data.length) {
											akb021str = akb021str + ""
													+ data[i].akb021 + "";
											akb020str = akb020str + "'"
													+ data[i].akb020 + "'";
										} else {
											akb021str = akb021str + ""
													+ data[i].akb021 + ",";
											akb020str = akb020str + "'"
													+ data[i].akb020 + "',";
										}
									}
									btnEdit.setValue(akb020str);
									btnEdit.setText(akb021str);
								}
							}

						}
					});

		}
		function search() {
			var data = queryForm.getData(true);
			grid1.load(data);
		}
		function queryHistory(e) {
			var grid = e.sender;
			var record = grid.getSelected();
			mini
					.open({
						url : "${pageContext.request.contextPath}/pages/pub/queryHistory_sjzdbz.jsp",
						title : "审核历史",
						width : 550,
						height : 300,
						onload : function() {
							var iframe = this.getIFrameEl();
							var data = {
								baz011 : record.baz011,
								flag : 1
							};
							iframe.contentWindow.SetData(data);
						},
						ondestroy : function(action) {

						}
					});
		}

		function resetFrom() {
			queryForm.reset();
		}
	</script>
</body>
</html>
