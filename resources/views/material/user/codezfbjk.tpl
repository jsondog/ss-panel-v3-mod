








{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">充值</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
									 	<p class="card-heading"><code>请认真看下面的说明后再进行操作，谢谢合作。</code></p>
										<p>充值成功后，概不退款，请注意。</p> 
										<p>当前余额：{$user->money} 元</p>
										<p><a href="https://console.limaoss.net/user/shop">点我购买套餐</a></p>
									</div>
									
								</div>
							</div>
						</div>
					</div>


					{if $pmw!=''}
                                                       <div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
									<th>用户 ID：{$pmw}</th>
																			</div>
								</div>
							</div>
						</div>
					</div>


						<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
									<th>充值方式一：</th>
										<p><b>支付宝网页转账</b>充值说明:按照下面的步骤,转账成功,自动到账</p>
										<p>第1步　复制地址(手动在浏览器上打开)：https://shenghuo.alipay.com/send/payment/fill.htm </p>
										<p>第2步　收款支付宝帐号： 76373764@qq.com </p>
										<p>第3步　收款人姓名 *珠基 ,姓名要核对一下。 </p>
										<p>第4步　务必填写付款说明：{$pmw} </p>  
									</div>
								</div>
							</div>
						</div>
					</div>
					

					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
									<th>充值方式二：</th>
										<p><b>打开手机支付宝，扫描以下二维码进行转账，备注请填写 {$pmw} <br></p>
						<img src="/QR.jpg"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					

                                             <div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
									<th>充值方式三：</th> 
										<p><b>打开手机微信，扫描以下二维码进行转账，备注请填写  {$pmw}、点击<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=76373764&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:76373764:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>进行处理<br></p>
						<img src="/WX.jpg"/>

									</div>
								
								</div>
							</div>
						</div>
					</div>


					


					{/if}
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<div class="card-table">
											<div class="table-responsive">
												{$codes->render()}
												<table class="table table-hover">
													<tr>
														<th>ID</th>
														<th>代码</th>
														<th>类型</th>
														<th>操作</th>
														<th>使用时间</th>
														
													</tr>
													{foreach $codes as $code}
														{if $code->type!=-2}
															<tr>
																<td>#{$code->id}</td>
																<td>{$code->code}</td>
																{if $code->type==-1}
																<td>金额充值</td>
																{/if}
																{if $code->type==10001}
																<td>流量充值</td>
																{/if}
																{if $code->type==10002}
																<td>用户续期</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>等级续期 - 等级{$code->type}</td>
																{/if}
																{if $code->type==-1}
																<td>充值 {$code->number} 元</td>
																{/if}
																{if $code->type==10001}
																<td>充值 {$code->number} GB 流量</td>
																{/if}
																{if $code->type==10002}
																<td>延长账户有效期 {$code->number} 天</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>延长等级有效期 {$code->number} 天</td>
																{/if}
																<td>{$code->usedatetime}</td>
															</tr>
														{/if}
													{/foreach}
												</table>
												{$codes->render()}
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
	$(document).ready(function () {
		$("#code-update").click(function () {
			$.ajax({
				type: "POST",
				url: "code",
				dataType: "json",
				data: {
					code: $("#code").val()
				},
				success: function (data) {
					if (data.ret) {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					} else {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					}
				},
				error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
				}
			})
		})
		
		
	timestamp = {time()}; 
		
		
	function f(){
		$.ajax({
			type: "GET",
			url: "code_check",
			dataType: "json",
			data: {
				time: timestamp
			},
			success: function (data) {
				if (data.ret) {
					clearTimeout(tid);
					$("#result").modal();
					$("#msg").html("充值成功！");
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}
			}
		});
		tid = setTimeout(f, 1000); //循环调用触发setTimeout
	}
	setTimeout(f, 1000);
})
</script>

