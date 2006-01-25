<table summary="" style="width:100%;">
	<tr>
		<td style="width:50%;">
			<!--Upper left-->	
			
			<h2>{t}Generic{/t}</h2>
			<table summary="" cellpadding=5>
				<tr>
					<td >{t}System type{/t}
					</td>
					<td>
						<select name="type" {$typeACL}>
							{html_options values=$SystemTypeKeys output=$SystemTypes selected=$type}
						</select>
						<input type="submit" value="{t}edit{/t}" name="edit_type" {$typeACL}>	
					</td>
				</tr>
				<tr>
					<td>{t}Operating system{/t}
					</td>
					<td>
						<select name="os" {$osACL}>
							{html_options values=$OSKeys output=$OSs selected=$os}
						</select>	
						<input type="submit" value="{t}edit{/t}" name="edit_os" {$osACL}>	
					</td>
				</tr>
				<tr>
					<td>{t}Manufacturer{/t}
					</td>
					<td>
						<select name="FK_glpi_enterprise" {$FK_glpi_enterpriseACL}>
							{html_options values=$ManufacturerKeys output=$Manufacturers selected=$FK_glpi_enterprise}
						</select>	
						<input type="submit" value="{t}edit{/t}" name="edit_manufacturer" {$FK_glpi_enterpriseACL}>	
					</td>
				</tr>
				<tr>
					<td>{t}Technical responsible{/t}&nbsp;
					</td>
					<td>
						<i>{$tech_num}&nbsp; </i>&nbsp;
						<input type="submit" value="{t}Edit{/t}" name="SelectTechPerson" {$tech_numACL}>
					</td>
				</tr>
			</table>
		</td>
		<td style="border-left: 1px solid rgb(160, 160, 160); vertical-align: top; padding-right: 5px;">

			<!--Upper right-->
			<h2>{t}Contacts{/t}</h2>
			<table summary="" width="100%">
				<tr>
					<td>
						{t}Contact person{/t}
					</td>
					<td width="100%">
						<i>{$contact_num}&nbsp; </i>&nbsp;
						<input {$contact_numACL} type="submit" name="SelectContactPerson" value="{t}Edit{/t}">
					</td>
				</tr>
				<tr>
					<td valign="top">
						{t}Comments{/t}
					</td>
					<td>
						<textarea name="comments" style="width:100%;height:110px;" {$commentsACL}>{$comments}</textarea>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<p class="seperator" >&nbsp;</p>
<table summary="" style="width:100%;">
	<tr>
		<td style="width:50%;">
			<h2>{t}Installed devices{/t}</h2>
			<table summary="" width="100%">	
				<tr>
					<td>
						<select name="InstalledDevices" {$InstalledDevicesACL} style="height:120px;width:100%;" multiple>
							{html_options values=$InstalledDeviceKeys output=$InstalledDevices}
						</select>
						<input name="AddDevice" value="{t}Edit{/t}" type="submit" {$InstalledDevicesACL}>	
					</td>
				</tr>
			</table>
			<p class="seperator" >&nbsp;</p>
			<input type="submit" value="{t}Trading{/t}" name="Trading">	
			<input type="submit" value="{t}Software{/t}" name="Software">	
			<input type="submit" value="{t}Contracts{/t}" name="Contracts">	
		</td>
		<td style="border-left: 1px solid rgb(160, 160, 160); vertical-align: top; padding-right: 5px;">
			<h2>{t}Attachments{/t}</h2>
			<table summary="" width="100%">	
				<tr>
					<td>
						{$AttachmentsDiv}
						<input name="AddAttachment" 	value="{t}Add{/t}" type="submit" {$AttachmentsACL}>	
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
<input type="hidden" name="glpi_tpl_posted" value="1">
