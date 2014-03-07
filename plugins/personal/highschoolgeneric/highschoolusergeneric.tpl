<h3>{t}Student Personal information{/t}</h3>

<table summary="{t}Personal information{/t}">
 <tr>
  <td>

   <!-- The users picture settings container -->
   <table summary="{t}The users picture{/t}">
    <tr>
     <td style='width:147px; height:200px; background-color:gray; vertical-align: middle;' >
      {if !$userPicture_is_readable}
      <img  src="plugins/users/images/default.jpg" alt=''>
      {else}
      <img  src="getbin.php?rand={$rand}" alt='' style='max-width:147px; max-height: 200px; vertical-align: middle;' >
      {/if}
     </td>
    </tr>
    <tr>
     <td>
      {render acl=$userPictureACL checkbox=$multiple_support checked=$use_edit_picture}
      <button type="submit" name="edit_picture">{t}Change picture{/t}...</button>
      {/render}
     </td>
    </tr>
   </table>

  </td> 
  <td style='width:45%'>
   <!-- The users personal settings container -->
   <table summary="{t}Account settings{/t}">
   
    <tr>
     <td>
      <div style="height:10px;"> </div>
      {t}Base{/t}{$must}
     </td>
     <td>
      <div style="height:10px;"> </div>
      {render acl=$baseACL checkbox=$multiple_support checked=$use_base}
      {$base}
      {/render}
     </td>
    </tr>
      
    <tr>
     <td><LABEL for="homeDirectory">{t}Home{/t}{$must}</LABEL></td>
     <td>
	  <input type="text" id="homeDirectory" name="homeDirectory" size=25 maxlength=60 value="{$homeDirectory}" readonly disabled>
	 </td>
    </tr>
   
    <tr>
     <td><LABEL for="highSchoolUserId">{t}Internal ID{/t}{$must}</LABEL></td>
     <td>
     {if $multiple_support}
     	<!-- TODO -->
		<input type="text" id="highSchoolUserId" name="dummy2" size=25 maxlength=60 value="{t}Multiple edit{/t}" disabled>
	 {else}
	  {render acl=$highSchoolUserIdACL}
		<input type="text" id="highSchoolUserId" name="highSchoolUserId" size=25 maxlength=60 value="{$highSchoolUserId}" readonly>
      {/render}
	 {/if}
	 </td>
    </tr>
    
    <tr>
     <td><LABEL for="irisPersonalUniqueID">{t}External ID{/t}{$must}</LABEL></td>
     <td>
     {if $multiple_support}
		<input type="text" id="irisPersonalUniqueID" name="dummy2" size=25 maxlength=60 value="{t}Multiple edit{/t}" disabled>
	{else}
	{render acl=$irisPersonalUniqueIDACL}
	    <input type="text" id="irisPersonalUniqueID" name="irisPersonalUniqueID" size=25 maxlength=60 value="{$irisPersonalUniqueID}">
	{/render}
	{/if}
	 </td>
    </tr>
    
    <tr>
     <td><LABEL for="irisPersonalUniqueIDType">{t}External ID Type{/t}{$must}</LABEL></td>
     <td>
      {render acl=$irisPersonalUniqueIDTypeACL checkbox=$multiple_support checked=$irisPersonalUniqueIDType}
	  		<!-- Dinamically fill with javascript -->
	  		<select size="1" id="irisPersonalUniqueIDType" name="irisPersonalUniqueIDType"/>
	  {/render}
	 </td>
    </tr>

{if $is_template ne "true"}
    
    <tr>
     <td><label for="sn1">{t}First last name{/t}{$must}</label></td>
     <td>
	{if $multiple_support}
		<input type="text" id="sn1" name="dummy2" size=25 maxlength=60 value="{t}Multiple edit{/t}" disabled>
	{else}
		{render acl=$sn1ACL}
			<input type="text" id="sn1" name="sn1" size=25 maxlength=60 value="{$sn1}" 
				onchange="document.getElementById('fullName').value = document.getElementById('sn1').value + ' ' + document.getElementById('sn2').value + ' ,' + document.getElementById('givenName').value ;">
		{/render}
	{/if}
	 </td>
    </tr>

    <tr>
     <td><label for="sn2">{t}Second last name{/t}</label></td>
     <td>

	{if $multiple_support}
		<input type="text" id="sn2" name="dummy3" size=25 maxlength=60 value="{t}Multiple edit{/t}" disabled>
	{else}
		{render acl=$sn2ACL}
			<input type="text" id="sn2" name="sn2" size=25 maxlength=60 value="{$sn2}"
				onchange="document.getElementById('fullName').value = document.getElementById('sn1').value + ' ' + document.getElementById('sn2').value + ' ,' + document.getElementById('givenName').value ;">
		{/render}
	{/if}

	 </td>
    </tr>
    
	<tr>
     <td><label for="givenName">{t}First name{/t}{$must}</label></td>
     <td>

	{if $multiple_support}
		<input type="text" id="givenName" name="dummy3" size=25 maxlength=60 value="{t}Multiple edit{/t}" disabled>
	{else}
		{render acl=$givenNameACL}
			<input type="text" id="givenName" name="givenName" size=25 maxlength=60 value="{$givenName}"
			onchange="document.getElementById('fullName').value = document.getElementById('sn1').value + ' ' + document.getElementById('sn2').value + ' ,' + document.getElementById('givenName').value ;">
		{/render}
	{/if}
	 </td>
    </tr>
    <tr>
     <td><label for="uid">{t}Login{/t}{$must}</label></td>
     <td>
		{if !$multiple_support}
			{render acl=$uidACL}
			<input type="text" id="uid" name="uid" size=25 maxlength=60  value="{$uid}" disabled="disabled"
			onchange="document.getElementById('labeledURI').value = 'http://alumnes.iesebre.com/~' + document.getElementById('uid').value;">
			{/render}
		{else}
			<input type="text" id="uid" name="dummy1" size=25 maxlength=60  value="{t}Multiple edit{/t}" disabled>
		{/if}
	 </td>
    </tr>

{else}
    <tr>
     <td><label for="sn">{t}Template name{/t}{$must}</label></td>
     <td>{render acl=$snACL}<input type="text" id="sn" name="sn" size=25 maxlength=60 value="{$sn}">{/render}</td>
    </tr>
{/if}

    <!-- Show Full Name --> 
    <tr>
     <td><label for="fullName">{t}Full name{/t}</label></td>
     <td>
	{render acl=$fullNameACL}
		<input type="text" id="fullName" name="fullName" size=25 maxlength=60 value="{$sn1} {$sn2}, {$givenName}" readonly="yes" disabled="disabled">
	{/render}
	 </td>
    </tr>
    
     {if !$multiple_support}

    <!-- Date of birth container (not visible in mutliple edit) -->
    <tr>
     <td>
      <div style="height:10px;"></div>
      <label for="dateOfBirth">{t}Date of birth{/t}</label>
     </td>
     <td>
      <div style="height:10px;"></div>
       {render acl=$dateOfBirthACL}
        <input type="text" id="dateOfBirth" name="dateOfBirth" class="date" value="{$dateOfBirth}">
         {if $dateOfBirthACL|regex_replace:"/[cdmr]/":"" == "w"}
          <script type="text/javascript">
           {literal}
            var datepicker  = new DatePicker(
                  { relative : 'dateOfBirth', 
                    language : '{/literal}{$lang}{literal}', 
                    keepFieldEmpty : true,
                    enableCloseEffect : false, 
                    enableShowEffect : false });
           {/literal}
          </script>
         {/if}
      {/render}
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="gender">{t}Sex{/t}</label>
     </td>
     <td>
	  {render acl=$genderACL checkbox=$multiple_support checked=$gender}
       <select size="1" id="gender" name="gender">
        {html_options options=$gender_list selected=$gender}
       </select>
      {/render}
     </td>
    </tr>
    
    {/if}

   <!-- Additional account/template settings -->
    <tr>
     <td>
      <label for="personalTitle">{t}Position{/t} 1</label>
     </td>
     <td>
	    <!-- Dinamically fill with javascript -->
	    {render acl=$highSchoolUserPosition1ACL checkbox=$multiple_support checked=$highSchoolUserPosition1}
	    	<select size="1" id="highSchoolUserPosition1" name="highSchoolUserPosition1"/>
	    {/render}
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="academicTitle">{t}Position{/t} 2</label>
     </td>
     <td>
		{render acl=$highSchoolUserPosition2ACL checkbox=$multiple_support checked=$highSchoolUserPosition2}
       		<select size="1" id="highSchoolUserPosition2" name="highSchoolUserPosition2"/>
	    {/render}
     </td>
    </tr>

   

   </table>

  </td>
  <td class='left-border'>   &nbsp;
  </td>

  <td>
  
   <table summary="{t}Postal address{/t}"> 
    
     <td><label for="highSchoolTSI">{t}TSI{/t}</label></td>
     <td>
{render acl=$highSchoolTSIACL checkbox=$multiple_support checked=$use_highSchoolTSI}
		<input type="text" id="highSchoolTSI" name="highSchoolTSI" size=25 maxlength=60 value="{$highSchoolTSI}">
{/render}
     </td>
    </tr>

    <tr>
     <td><label for="homePhone">{t}Private phone{/t}</label>
      </td><td>
      {render acl=$homePhoneACL checkbox=$multiple_support checked=$use_homePhone}
      <input type="text" id="homePhone" name="homePhone" size=25 maxlength=60 value="{$homePhone}">
      {/render}
     </td>
    </tr>

	<tr>
     <td><label for="mobile">{t}Mobile phone{/t}</label>
     </td><td>
{render acl=$mobileACL checkbox=$multiple_support checked=$use_mobile}
	     <input type="text" id="mobile" name="mobile" size=25 maxlength=60 value="{$mobile}">
{/render}
     </td>
    </tr>
 
	<tr>
     <td style="vertical-align:top;"><label for="l">{t}Locality{/t}</label></td>
      <td>
{render acl=$lACL checkbox=$multiple_support checked=$use_l}
	     <input type="text" id="l" name="l" size=25 maxlength=60 value="{$l}">
{/render}
     </td>
    </tr>
    <tr>
     <td style="vertical-align:top;"><label for="st">{t}Province{/t}</label></td>
      <td>
{render acl=$stACL checkbox=$multiple_support checked=$use_st}
	     <input type="text" id="st" name="st" size=25 maxlength=60 value="{$st}">
{/render}
     </td>
    </tr>
    <tr>
     <td style="vertical-align:top;"><label for="postalCode">{t}Postal Code{/t}</label></td>
      <td>
{render acl=$postalCodeACL checkbox=$multiple_support checked=$use_postalCode}
	     <input type="text" id="postalCode" name="postalCode" size=25 maxlength=60 value="{$postalCode}">
{/render}
     </td>
    </tr>
    
     <tr>
     <td style="vertical-align:top;"><label for="homePostalAddress">{t}Address{/t}</label></td>
      <td>
{render acl=$homePostalAddressACL checkbox=$multiple_support checked=$use_homePostalAddress}
	     <textarea id="homePostalAddress" name="homePostalAddress" rows="3" style="width:100%">{$homePostalAddress}</textarea>
{/render}
     </td>
    </tr>
    
    	<tr>
     <td><label for="highSchoolPersonalEmail">{t}Email{/t}</label>
     </td><td>
{render acl=$highSchoolPersonalEmailACL checkbox=$multiple_support checked=$use_highSchoolPersonalEmail}
	     <input type="text" id="highSchoolPersonalEmail" name="highSchoolPersonalEmail" size=25 maxlength=60 value="{$highSchoolPersonalEmail}">
{/render}
     </td>
    </tr>


    <tr>
     <td><label for="labeledURI">{t}Homepage{/t}</label></td>
     <td>
      {render acl=$labeledURIACL checkbox=$multiple_support checked=$use_labeledURI}
      <input type="text" id="labeledURI" name="labeledURI" size="33" value="{$labeledURI}">
      {/render}
     </td>
    </tr>

	<tr>
     <td><label for="email">{t}Corporative Email{/t}</label></td>
     <td>
{render acl=$emailACL checkbox=$multiple_support checked=$use_email}
	 	<input type="text" id="email" name="email" size=25 maxlength=60 value="{$email}">
{/render}
     </td>
    </tr>
    <tr>
     <td colspan=2>
      <div style="height:10px;"></div>
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="preferredLanguage">{t}Preferred language{/t}</label>
     </td>
     <td>
      {render acl=$preferredLanguageACL checkbox=$multiple_support checked=$use_preferredLanguage}
      <select size="1" id="preferredLanguage" name="preferredLanguage">
       {html_options options=$preferredLanguage_list selected=$preferredLanguage}
      </select>
      {/render}
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="highSchoolUserCreatedAt">{t}Created at{/t}</label>
     </td>
     <td>
      <input type="text" id="highSchoolUserCreatedAt" name="highSchoolUserCreatedAt" size=25 maxlength=60 value="{$highSchoolUserCreatedAt}" readonly disabled="true">
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="highSchoolUserCreatedBy">{t}Created by{/t}</label>
     </td>
     <td>
      <input type="text" id="highSchoolUserCreatedBy" name="highSchoolUserCreatedBy" size=25 maxlength=60 value="{$highSchoolUserCreatedBy}" readonly disabled="true">
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="highSchoolUserLastModifiedBy">{t}Last Modified by{/t}</label>
     </td>
     <td>
      <input type="text" id="$highSchoolUserLastModifiedBy" name="$highSchoolUserLastModifiedBy" size=25 maxlength=60 value="{$highSchoolUserLastModifiedBy}" readonly disabled="true">
     </td>
    </tr>
    
    <tr>
     <td>
      <label for="highSchoolUserLastModifiedAt">{t}Last Modified At{/t}</label>
     </td>
     <td>
      <input type="text" id="highSchoolUserLastModifiedAt" name="highSchoolUserLastModifiedAt" size=25 maxlength=60 value="{$highSchoolUserLastModifiedAt}" readonly disabled="true">
     </td>
    </tr>
    
    

<!--
    <tr>
     <td><label for="pw_storage">{t}Password storage{/t}</label></td>
     <td>
      {render acl=$passwordStorageACL checkbox=$multiple_support checked=$use_pw_storage}
      <select size="1" id="pw_storage" name="pw_storage" onchange='document.mainform.submit()'>
       {foreach from=$pwmode key=value item=desc}
       <option value="{$value}" {if $pwmode_select == $value}selected{/if} >{$desc}</option>
       {/foreach}
      </select>
      {if $pw_configurable eq "true"}
      &nbsp; <button id="edit_pw_method" type="submit" name="edit_pw_method">{t}Configure{/t}...</button>
      {/if}
      {/render}
     </td>
    </tr>
    
    {if $is_template ne "true" && !$multiple_support}
    <tr>
     <td><label for="edit_cert">{t}Certificates{/t}</label></td>
     <td>
      {render acl=$CertificatesACL mode=read_active}
      <button id="edit_cert" type="submit" name="edit_cert">{t}Edit certificates{/t}...</button>
      {/render}
     </td>
    </tr>
    {/if}
    
    <tr>
     <td colspan=2>
      <div style="height:10px;"></div>
     </td>
    </tr>
    <tr>
     <td colspan="2"><label for="res">{t}Restrict login to{/t}</label>
      
      {if !$multiple_support}
      {render acl=$gosaLoginRestrictionACL}
      {$gosaLoginRestrictionWidget}
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <input type="text" id="res" name="res" maxlength=33 
      value="{t}IP or network{/t}" onFocus='document.getElementById("res").value=""'>
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <button id="add_res" type="submit" name="add_res">{t}Add{/t}</button>
      {/render}
      
      {else}
      <input type='checkbox' name='use_gosaLoginRestriction' {if $use_gosaLoginRestriction} checked {/if}
      onClick='document.mainform.submit();'
      >
      {if !$use_gosaLoginRestriction}
      {render acl=$gosaLoginRestriction_ONLY_R_ACL}
      {$gosaLoginRestrictionWidget}
      {/render}
      {else}
      {render acl=$gosaLoginRestrictionACL}
      {$gosaLoginRestrictionWidget}
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <input type="text" id="res" name="res" maxlength=33 
      value="{t}IP or network{/t}" onFocus='document.getElementById("res").value=""'>
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <button id="add_res" type="submit" name="add_res">{t}Add{/t}</button>
      {/render}
      {/if}
      {/if}
     </td>
    </tr>
    -->
    
    
    
   </table>
  </td>
 </tr>
</table>

<hr>

<table summary="{t}Organizational information{/t}">
 <tr>
  <td colspan="3">
   <h3>{t}Organizational information{/t}</h3>
  </td>
 </tr>
 <tr>

  {if $governmentmode ne "true"}
  <!-- Company, ... -->
  <td>
   <table summary="{t}Organizational information{/t} - {t}part{/t} 1">
    <tr>
     <td><label for="o">{t}Organization{/t}</label></td>
     <td>	
      {render acl=$oACL checkbox=$multiple_support checked=$use_o}
      <input type="text" id="o" name="o" maxlength=60 value="{$o}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="ou">{t}Department{/t}</label></td>
     <td>
      {render acl=$ouACL checkbox=$multiple_support checked=$use_ou}
      <input type="text" id="ou" name="ou" maxlength=60 value="{$ou}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="departmentNumber">{t}Department No.{/t}</label></td>
     <td>
      {render acl=$departmentNumberACL checkbox=$multiple_support checked=$use_departmentNumber}
      <input type="text" id="departmentNumber" name="departmentNumber" maxlength=60 value="{$departmentNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="employeeNumber">{t}Employee No.{/t}</label></td>
     <td>
      {render acl=$employeeNumberACL checkbox=$multiple_support checked=$use_employeeNumber}
      <input type="text" id="employeeNumber" name="employeeNumber" maxlength=60 value="{$employeeNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="employeeType">{t}Employee type{/t}</label></td>
     <td>
      {render acl=$employeeTypeACL checkbox=$multiple_support checked=$use_employeeType}
      <input type="text" id="employeeType" name="employeeType" maxlength=60 value="{$employeeType}">
      {/render}
     </td>
    </tr>
    {if !$multiple_support}
    <tr>
     <td><label for="manager_name">{t}Manager{/t}</label></td>
     <td>
      {render acl=$managerACL}
        <input type='text' name='manager_name' id='manager_name' value='{$manager_name}' disabled title='{$manager}'
          style='width:120px;'>
      {/render}

      {image path="images/lists/edit.png" action="editManager" acl=$managerACL}
      {if $manager!=""}
        {image path="images/info_small.png" title="{$manager}" acl=$managerACL}
        {image path="images/lists/trash.png" action="removeManager" acl=$managerACL}
      {/if}
     </td>
    </tr>
    {else}
    <tr>
     <td><label for="manager">{t}Manager{/t}</label></td>
     <td>
      <input type='checkbox' value="1" name="use_manager" id="use_manager" {if $use_manager} checked {/if}
      onClick="document.mainform.submit();">
      <input type='text' name='manager_name' id='manager_name' value='{$manager_name}' disabled
      title='{$manager}'>
      {if $use_manager}
      {image path="images/lists/edit.png" action="editManager"}

      {if $manager!=""}
      {image path="images/info_small.png" title="{$manager}"}

      {image path="images/lists/trash.png" action="removeManager"}

      {/if}
      {/if}
     </td>
    </tr>
    
    {/if}
   </table>
  </td>
  
  <td class='left-border'>   &nbsp;
  </td>
  
  <!-- Phone, ... -->
  <td>
   <table summary="{t}Organizational information{/t} - {t}part{/t} 2">
    <tr>
     <td><label for="roomNumber">{t}Room No.{/t}</label></td>
     <td>
      {render acl=$roomNumberACL checkbox=$multiple_support checked=$use_roomNumber}
      <input type="text" id="roomNumber" name="roomNumber" maxlength=60 value="{$roomNumber}">
      {/render}
     </td>
    </tr>
    {if $has_phoneaccount ne "true"}
    <tr>
     <td><label for="telephoneNumber">{t}Phone{/t}</label></td>
     <td>
      {render acl=$telephoneNumberACL checkbox=$multiple_support checked=$use_telephoneNumber}
      <input type="text" id="telephoneNumber" name="telephoneNumber" maxlength=60 value="{$telephoneNumber}">
      {/render}
     </td>
    </tr>
    {/if}
<!--
    <tr>
     <td><label for="mobile">{t}Mobile{/t}</label></td>
     <td>
      {render acl=$mobileACL checkbox=$multiple_support checked=$use_mobile}
      <input type="text" id="mobile" name="mobile" maxlength=60 value="{$mobile}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="pager">{t}Pager{/t}</label></td>
     <td>
      {render acl=$pagerACL checkbox=$multiple_support checked=$use_pager}
      <input type="text" id="pager" name="pager" maxlength=60 value="{$pager}">
      {/render}
     </td>
    </tr>
-->
    <tr>
     <td><label for="facsimileTelephoneNumber">{t}Fax{/t}</label></td>
     <td>
      {render acl=$facsimileTelephoneNumberACL checkbox=$multiple_support checked=$use_facsimileTelephoneNumber}
      <input type="text" id="facsimileTelephoneNumber" name="facsimileTelephoneNumber" maxlength=60 value="{$facsimileTelephoneNumber}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  <td class='left-border'>   &nbsp;
  </td>
  
  <!-- Location, ... -->
  <td style='width:33%'>
   <table summary="{t}Organizational information{/t} - {t}part{/t} 3">
    <tr>
     <td><label for="postalAddress">{t}Address{/t}</label></td>
     <td>
      {render acl=$postalAddressACL checkbox=$multiple_support checked=$use_postalAddress}
        <textarea cols="200" id="postalAddress" name="postalAddress" rows=3 style="width:100%">{$postalAddress}</textarea>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  {else} 
  
  <!-- Beschreibung, ... -->
  <td class="right-border">
   <table summary="{t}Organizational information{/t} - {t}part{/t} 1">
    <tr>
     <td><label for="vocation">{t}Vocation{/t}</label></td>
     <td>
      {render acl=$vocationACL checkbox=$multiple_support checked=$use_vocation}
      <input type="text" id="vocation" name="vocation" maxlength=60 value="{$vocation}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="gouvernmentOrganizationalUnitDescription">{t}Unit description{/t}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalUnitDescriptionACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalUnitDescription}
      <input type="text" id="gouvernmentOrganizationalUnitDescription" name="gouvernmentOrganizationalUnitDescription" maxlength=60
      value="{$gouvernmentOrganizationalUnitDescription}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="gouvernmentOrganizationalUnitSubjectArea">{t}Subject area{/t}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalUnitSubjectAreaACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalUnitSubjectArea}
      <input type="text" id="gouvernmentOrganizationalUnitSubjectArea" name="gouvernmentOrganizationalUnitSubjectArea" maxlength=60
      value="{$gouvernmentOrganizationalUnitSubjectArea}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="functionalTitle">{t}Functional title{/t}</label></td>
     <td>
      {render acl=$functionalTitleACL checkbox=$multiple_support checked=$use_functionalTitle}
      <input type="text" name="functionalTitle" id="functionalTitle"  maxlength=60
      value="{$functionalTitle}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="role">{t}Role{/t}</label></td>
     <td>
      {render acl=$roleACL checkbox=$multiple_support checked=$use_role}
      <input type="text" id="role" name="role" maxlength=60 value="{$role}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  <!-- Phone, ... -->
  <td class='right-border'>
   <table summary="{t}Organizational information{/t} - {t}part{/t} 2">
    <tr>
     <td><label for="gouvernmentOrganizationalPersonLocality">{t}Person locality{/t}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalPersonLocalityACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalPersonLocality}
      <input type="text" id="gouvernmentOrganizationalPersonLocality" name="gouvernmentOrganizationalPersonLocality" maxlength=60
      value="{$gouvernmentOrganizationalPersonLocality}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="gouvernmentOrganizationalUnit">{t}Unit{/t}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalUnitACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalUnit}
      <input type="text" id="gouvernmentOrganizationalUnit" name="gouvernmentOrganizationalUnit" maxlength=60 
      value="{$gouvernmentOrganizationalUnit}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="street">{t}Street{/t}</label></td>
     <td>
      {render acl=$streetACL checkbox=$multiple_support checked=$use_street}
      <input type="text" name="street" id="street" maxlength=60 value="{$street}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="postalCode">{t}Postal code{/t}</label></td>
     <td> 
      {render acl=$postalCodeACL checkbox=$multiple_support checked=$use_postalCode}
      <input type="text" name="postalCode" id="postalCode" maxlength=60 value="{$postalCode}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="houseIdentifier">{t}House identifier{/t}</label></td>
     <td>
      {render acl=$houseIdentifierACL checkbox=$multiple_support checked=$use_houseIdentifier}
      <input type="text" id="houseIdentifier" name="houseIdentifier" maxlength=60
      value="{$houseIdentifier}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  <!-- Location, ... -->
  <td>
   <table summary="{t}Organizational information{/t} - {t}part{/t} 3">
    <tr>
     <td><label for="roomNumber">{t}Room No.{/t}</label></td>
     <td>
      {render acl=$roomNumberACL checkbox=$multiple_support checked=$use_roomNumber}
      <input type="text" id="roomNumber" name="roomNumber" maxlength=60 value="{$roomNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="telephoneNumber">{t}Phone{/t}</label></td>
     <td>
      {render acl=$telephoneNumberACL checkbox=$multiple_support checked=$use_telephoneNumber}
      {if $has_phoneaccount ne "true"}
      <input type="text" id="telephoneNumber" name="telephoneNumber" maxlength=60 value="{$telephoneNumber}">
      {else}
      <i>{t}Please use the phone tab{/t}</i>
      {/if}
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="facsimileTelephoneNumber">{t}Fax{/t}</label></td>
     <td>
      {render acl=$facsimileTelephoneNumberACL checkbox=$multiple_support checked=$use_facsimileTelephoneNumber}
      <input type="text" id="facsimileTelephoneNumber" name="facsimileTelephoneNumber" maxlength=60 
      value="{$facsimileTelephoneNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="ivbbLastDeliveryCollective">{t}Last delivery{/t}</label></td>
     <td>
      {render acl=$ivbbLastDeliveryCollectiveACL checkbox=$multiple_support checked=$use_ivbbLastDeliveryCollective}
      <input type="text" name="ivbbLastDeliveryCollective" maxlength=60 id="ivbbLastDeliveryCollective" 
      value="{$ivbbLastDeliveryCollective}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="publicVisible">{t}Public visible{/t}</label></td>
     <td>
      {render acl=$publicVisibleACL checkbox=$multiple_support checked=$use_publicVisible}
      <select size="1" id="publicVisible" name="publicVisible">
       {html_options values=$ivbbmodes output=$ivbbmodes selected=$publicVisible}
      </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  {/if} 
 </tr>
</table>




<!--  HIDDEN FILES -->

{if $multiple_support}
<input type="hidden" name="user_mulitple_edit" value="1">
{/if}
<!-- Used at save_object() function at class class_user.inc: -->
<input type=hidden name="generic">
<input type=hidden name="highschoolgeneric">


<!-- Javascript code to Place cursor -->
{literal}
<script language="JavaScript" type="text/javascript">
<!-- // First input field on page
focus_field('irisPersonalUniqueID');
-->
</script>
{/literal}
