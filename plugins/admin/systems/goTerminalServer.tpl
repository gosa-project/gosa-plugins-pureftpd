<h2><img class="center" alt="" align="middle" src="images/rightarrow.png" /> {t}Terminal service{/t}</h2>
<table summary="">
    <tr>
     <td colspan=2>
{render acl=$goXdmcpIsEnabledACL}
      <input type="checkbox" value="true" name="goXdmcpIsEnabled" id="Temporariid" {if $goXdmcpIsEnabled} checked {/if}>
{/render}
	{t}Temporary disable login{/t}
     </td>
    </tr>
    <tr>
     <td>{t}Font path{/t}</td>
     <td> 
{render acl=$goXdmcpIsEnabledACL}
      <input type="text" value="{$goFontPath}" name="goFontPath" {$goXdmcpIsEnabledACL}  id="FontPathId">
{/render}
     </td>
    </tr>
   </table>

<p class='seperator'>&nbsp;</p>
<div style="width:100%; text-align:right;">
<p>
    <input type='submit' name='SaveService' value='{t}Save{/t}'>
    &nbsp;
    <input type='submit' name='CancelService' value='{t}Cancel{/t}'>
</p>
</div>
<input type="hidden" name="goTerminalServerPosted" value="1">