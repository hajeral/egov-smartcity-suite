<%--
  ~ eGov suite of products aim to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) <2015>  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  --%>

<div class="panel panel-primary" data-collapsed="0"
			style="text-align: left">
			<div class="panel-heading">
				<div class="panel-title"><s:text name="contractor.grade.header" /></div>
			</div>
			
			<div class="panel-body">
			
				<div class="form-group">
					<label class="col-sm-2 control-label text-right"> 
					   <s:text name="contractor.grade.master.grade" /> <span class="mandatory"></span>
					</label>
					<div class="col-sm-3 add-margin">
						<s:textfield name="grade" maxlength="20" id="grade"  cssClass="form-control" value="%{grade}" />
					</div>
					<label class="col-sm-2 control-label text-right"> 
						<s:text name="contractor.grade.master.description" /> <span class="mandatory"></span>
					</label>
					<div class="col-sm-3 add-margin">
						<s:textfield name="description" maxlength="100" cssClass="form-control" id="description" value="%{description}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label text-right"> 
					   <s:text name="contractor.grade.master.minamount" /> <span class="mandatory"></span>
					</label>
					<div class="col-sm-3 add-margin">
					  <s:textfield name="minAmount" id="minAmount"  cssClass="form-control text-right" value="%{minAmount}" placeholder="0" />
					</div>
					<label class="col-sm-2 control-label text-right"> 
						<s:text name="contractor.grade.master.maxamount" /> <span class="mandatory"></span>
					</label>
					<div class="col-sm-3 add-margin">
						<s:textfield name="maxAmount" id="maxAmount"  cssClass="form-control text-right" value="%{maxAmount}" placeholder="0" />
					</div>
				</div>
				
			</div>
</div>

<s:if test="%{mode=='view'}">
	<script>
	for(i=0;i<document.contractorGrade.elements.length;i++){
		document.contractorGrade.elements[i].disabled=true;
		document.contractorGrade.elements[i].readonly=true;
	} 
	</script>
</s:if>