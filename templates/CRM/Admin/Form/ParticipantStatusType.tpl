{*
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC. All rights reserved.                        |
 |                                                                    |
 | This work is published under the GNU AGPLv3 license with some      |
 | permitted exceptions and without any warranty. For full license    |
 | and copyright information, see https://civicrm.org/licensing       |
 +--------------------------------------------------------------------+
*}
<div class="crm-block crm-form-block crm-participant-status-form-block">
  <fieldset>
    <legend>
      {if $action eq 1}{ts}New Participant Status{/ts}{elseif $action eq 2}{ts}Edit Participant Status{/ts}{else}{ts}Delete Participant Status{/ts}{/if}
    </legend>
   <div class="crm-submit-buttons">{include file="CRM/common/formButtons.tpl" location="top"}</div>
    {if $action eq 8}
      <div class="messages status no-popup">
       {icon icon="fa-info-circle"}{/icon}
             {ts}WARNING: Deleting this Participant Status will remove all of its settings.{/ts} {ts}Do you want to continue?{/ts}
       </div>
      <div>{include file="CRM/common/formButtons.tpl" location=''}
      </div>
    {else}
      <table class="form-layout-compressed">
        <tr class="crm-participant-status-form-block-name">
           <td class="label">{$form.name.label}</td>
           <td>{$form.name.html}<br />
           <span class="description">{ts}Name of this status type, for use in the code.{/ts}</span></td>
        </tr>

        <tr class="crm-participant-status-form-block-label">
           <td class="label">{$form.label.label}{if $action == 2} {include file='CRM/Core/I18n/Dialog.tpl' table='civicrm_participant_status_type' field='label' id=$id}{/if}</td>
           <td>{$form.label.html}<br />
           <span class="description">{ts}Display label for this status.{/ts}</span></td>
        </tr>

        <tr class="crm-participant-status-form-block-class">
           <td class="label">{$form.class.label}</td>
           <td>{$form.class.html}<br />
            <span class="description">{ts}The general class of this status. Participant counts are grouped by class on the CiviEvent Dashboard. Participants with a 'Pending' class status will be moved to 'Expired' status if Pending Participant Hours has elapsed (when the ParticipantProcessor.php background processing script is run).{/ts}</span></td>
        </tr>
        {if !empty($form.is_reserved)}
        <tr class="crm-participant-status-form-block-is_reserved">
           <td class="label">{$form.is_reserved.label}</td>
           <td>{$form.is_reserved.html}</td>
        </tr>
        {/if}
        <tr class="crm-participant-status-form-block-is_active">
           <td class="label">{$form.is_active.label}</td>
           <td>{$form.is_active.html}</td>
        </tr>
        <tr class="crm-participant-status-form-block-is_counted">
           <td class="label">{$form.is_counted.label}</td>
           <td>{$form.is_counted.html}<br />
           <span class="description">{ts}Should a person with this status be counted as a participant for the purpose of controlling the Maximum Number of Participants?{/ts}</td>
        </tr>

        <tr class="crm-participant-status-form-block-weight">
           <td class="label">{$form.weight.label}</td>
           <td>{$form.weight.html}</td>
        </tr>

        <tr class="crm-participant-status-form-block-visibility_id">
           <td class="label">{$form.visibility_id.label}</td>
           <td>{$form.visibility_id.html}<br />
           <span class="description">{ts}If you allow users to select a Participant Status by including that field on a profile - only statuses with 'Public' visibility are listed.{/ts}</td>
        </tr>
      </table>
        <div class="crm-submit-buttons">{include file="CRM/common/formButtons.tpl" location="bottom"}</div>
    {/if}
    <div class="spacer"></div>
  </fieldset>
</div>
