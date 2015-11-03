/**
 * eGov suite of products aim to improve the internal efficiency,transparency,
   accountability and the service delivery of the government  organizations.

    Copyright (C) <2015>  eGovernments Foundation

    The updated version of eGov suite of products as by eGovernments Foundation
    is available at http://www.egovernments.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see http://www.gnu.org/licenses/ or
    http://www.gnu.org/licenses/gpl.html .

    In addition to the terms of the GPL license to be adhered to in using this
    program, the following additional terms are to be complied with:

	1) All versions of this program, verbatim or modified must carry this
	   Legal Notice.

	2) Any misrepresentation of the origin of the material is prohibited. It
	   is required that all modified versions of this material be marked in
	   reasonable ways as different from the original version.

	3) This license does not grant any rights to any user of the program
	   with regards to rights under trademark law for use of the trade names
	   or trademarks of eGovernments Foundation.

  In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */
package org.egov.infstr.models;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.egov.infra.persistence.entity.AbstractAuditable;
import org.egov.infra.persistence.validator.annotation.Required;
import org.egov.infra.persistence.validator.annotation.Unique;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.validator.constraints.Length;

@Entity
@Unique(fields = { "code" }, id = "id", tableName = "egcl_servicecategory", columnName = {
        "CODE" }, message = "masters.serviceCategoryCode.isunique")
@Table(name = "egcl_servicecategory")
@SequenceGenerator(name = ServiceCategory.SEQ_SERVICECATEGORY, sequenceName = ServiceCategory.SEQ_SERVICECATEGORY, allocationSize = 1)
public class ServiceCategory extends AbstractAuditable {

    private static final long serialVersionUID = 6424646245490617480L;
    public static final String SEQ_SERVICECATEGORY = "SEQ_EGCL_SERVICECATEGORY";

    @JsonIgnore
    @DocumentId
    @Id
    @GeneratedValue(generator = SEQ_SERVICECATEGORY, strategy = GenerationType.SEQUENCE)
    private Long id;

    @Required(message = "serviceCategoryName.null.validation")
    @Length(min = 1, max = 256, message = "masters.serviceCategory.nameLength")
    @Column(name = "name")
    private String name;

    @Required(message = "serviceCategoryCode.null.validation")
    @Length(max = 256, message = "masters.serviceCategory.codeLength")
    @Column(name = "code")
    private String code;

    @JsonIgnore
    @Column(name = "isactive")
    private Boolean isActive;
    @JsonIgnore
    @OneToMany(mappedBy = "serviceCategory", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
    private Set<ServiceDetails> services = new LinkedHashSet<ServiceDetails>(0);

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     *            the name to set
     */
    public void setName(final String name) {
        this.name = name;
    }

    /**
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code
     *            the code to set
     */
    public void setCode(final String code) {
        this.code = code;
    }

    /**
     * @return the isActive
     */
    public Boolean getIsActive() {
        return isActive;
    }

    /**
     * @param isActive
     *            the isActive to set
     */
    public void setIsActive(final Boolean isActive) {
        if (null == isActive)
            this.isActive = Boolean.FALSE;
        else
            this.isActive = isActive;
    }

    public Set<ServiceDetails> getServices() {
        return services;
    }

    public void setServices(final Set<ServiceDetails> services) {
        this.services = services;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(final Long id) {
        this.id = id;
    }
}