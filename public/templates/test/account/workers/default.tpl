<article class="module width_quarter">
  <header><h3 class="">Add New Worker</h3></header>
  <form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page}">
    <input type="hidden" name="action" value="{$smarty.request.action}">
    <input type="hidden" name="do" value="add">
    <div class="module_content">
      <fieldset>
        <label>Worker Name</label>
        <input type="text" name="username" value="user" size="10" maxlength="20" required>
      </fieldset>
      <fieldset>
        <label>Worker Password</label>
        <input type="text" name="password" value="password" size="10" maxlength="20" required>&nbsp;
      </fieldset>
      <div class="clear"></div>
    </div>
    <footer>
      <div class="submit_link">
        <input type="submit" value="Add New Worker" class="alt_btn">
      </div>
    </footer>
  </form>
</article>

<article class="module width_3_quarter">
  <header><h3 class="">Worker Configuration</h3></header>
  <form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page}">
    <input type="hidden" name="action" value="{$smarty.request.action}">
    <input type="hidden" name="do" value="update">
    <table class="tablesorter" cellspacing="0">
      <thead>
        <tr>
          <th class="header" align="left">Worker Login</th>
          <th class="header" align="left">Worker Password</th>
          <th class="header" align="center">Active</th>
          {if $GLOBAL.config.disable_notifications != 1}<th class="header" align="center">Monitor</th>{/if}
          <th class="header" align="center">Khash/s</th>
          <th class="header" align="center" style="padding-right: 25px;">Action</th>
        </tr>
      </thead>
      <tbody>
        {nocache}
          {section worker $WORKERS}
          {assign var="username" value="."|escape|explode:$WORKERS[worker].username:2} 
        <tr>
          <td align="left"{if $WORKERS[worker].hashrate > 0} style="color: orange"{/if}>{$username.0|escape}.<input name="data[{$WORKERS[worker].id}][username]" value="{$username.1|escape}" size="10" required/></td>
          <td align="left"><input type="text" name="data[{$WORKERS[worker].id}][password]" value="{$WORKERS[worker].password|escape}" size="10" required></td>
          <td align="center"><img src="{$PATH}/images/{if $WORKERS[worker].hashrate > 0}icn_alert_success{else}icn_alert_error{/if}.png" /></td>
          {if $GLOBAL.config.disable_notifications != 1}
          <td align="center">
            <input type="checkbox" name="data[{$WORKERS[worker].id}][monitor]" value="1" id="data[{$WORKERS[worker].id}][monitor]" {if $WORKERS[worker].monitor}checked{/if} />
            <label for="data[{$WORKERS[worker].id}][monitor]"></label>
          </td>
          {/if}
          <td align="right">{$WORKERS[worker].hashrate|number_format}</td>
          <td align="center" style="padding-right: 25px;"><a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$WORKERS[worker].id|escape}" class="icn_trash"><img src="{$PATH}/images/icn_trash.png" /></a></td>
        </tr>
          {/section}
        {/nocache}
      </tbody>
    </table>
    <div class="clear"></div>
    <footer>
      <div class="submit_link">
        <input type="submit" class="alt_btn" value="Update Workers">
      </div>
    </footer>
  </form>
</article>