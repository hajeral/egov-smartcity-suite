<%--
  ~    eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) 2017  eGovernments Foundation
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
  ~            Further, all user interfaces, including but not limited to citizen facing interfaces,
  ~            Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
  ~            derived works should carry eGovernments Foundation logo on the top right corner.
  ~
  ~            For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
  ~            For any further queries on attribution, including queries on brand guidelines,
  ~            please contact contact@egovernments.org
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
  ~
  --%>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><s:text name='CreateAck.title' /></title>
<script type="text/javascript">
	function onSubmit(action) {
		document.forms[0].action = action;
		document.forms[0].submit;
		return true;
	}
</script>
</head>

<body>
	<s:form name="CreatePropertyAckForm" theme="simple">
		<s:push value="model">
			<s:token />
			<div class="formmainbox">
				<div class="headingbg">
					<s:text name="CreatePropertyAckHeader" />
				</div>
				<br />
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<s:hidden name="modelId" id="modelId" value="%{id}" />
					<s:hidden name="applicationSource" value="%{applicationSource}" />
					<tr>
						<s:if test="mode == 'create' && (model.state.nextAction.endsWith(@org.egov.ptis.constants.PropertyTaxConstants@WF_STATE_BILL_COLLECTOR_APPROVAL_PENDING))">
							<s:if test="%{applicationNo != null && !applicationNo.isEmpty()}">
								<td colspan="5" style="font-size: 15px;" align="center"><s:property value="%{ackMessage}" /> <span
									class="bold"><s:property value="%{approverName}"/></span><s:property value="%{applicationNoMessage}"/><span
									class="bold"> <s:property value="%{applicationNo}" /></span></td>
							</s:if>
						</s:if>
						<s:elseif test="approved == true">
						<td colspan="5" style="font-size: 15px;" align="center">
						<s:property value="%{ackMessage}" /><span
									class="bold"><s:property value="%{propertyInitiatedBy}"/></span><s:property value="%{assessmentNoMessage}"/> <span class="bold"><s:property
									value="%{basicProperty.upicNo}" /> </span></td>
						</s:elseif>
						<s:elseif test="mode == 'edit' && @org.egov.ptis.constants.PropertyTaxConstants@PROPERTY_MODIFY_REASON_EDIT_DATA_ENTRY.equalsIgnoreCase(modifyRsn)">
							<td colspan="5" style="font-size: 15px;" align="center">
							<s:property value="%{ackMessage}" /> <span class="bold"><s:property value="%{basicProperty.upicNo}" /> </span></td>
						</s:elseif>
						<s:else>
							<td colspan="5" style="font-size: 15px;" align="center">
							<s:property value="%{ackMessage}"/><span
									class="bold"><s:property value="%{propertyInitiatedBy}"/><s:property value="%{approverName}"/></span><s:property value="%{applicationNoMessage}"/><span class="bold"><s:property value="%{applicationNo}" /></span></td>
						</s:else>
					</tr>
					<tr>
						<td>
							<div class="buttonbottom" align="center">
								<s:if test="mode == 'create'">
										<s:submit value="Print" name="PrintAck" id="PrintAck"
											method="printAck" cssClass="buttonsubmit" align="center"
											onclick="return onSubmit('createProperty-printAck.action');" />
								</s:if>
								&nbsp;
								<input type="button" class="button" onclick="window.close();" value="Close">
							</div>
						</td>
					</tr>
				</table>
				<br/>
			</div>
		</s:push>
	</s:form>
</body>
</html>
