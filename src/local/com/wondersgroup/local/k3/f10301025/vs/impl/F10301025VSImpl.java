package com.wondersgroup.local.k3.f10301025.vs.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.wondersgroup.bc.auditadministrativedisposal.admindis.model.bo.ApprovalClassList;
import com.wondersgroup.bc.auditadministrativedisposal.admindis.model.dto.Af31DTO;
import com.wondersgroup.bc.auditadministrativedisposal.admindis.model.dto.Af53DTO;
import com.wondersgroup.bc.auditadministrativedisposal.admindis.model.dto.CaseInfoDTO;
import com.wondersgroup.bc.k3.f10301025.bs.F10301025BS;
import com.wondersgroup.framework.core.bo.Page;
import com.wondersgroup.framework.core.exception.BusinessException;
import com.wondersgroup.framework.core5.business.context.UserContext;
import com.wondersgroup.framework.core5.business.context.support.BusinessContextUtils;
import com.wondersgroup.local.k3.f10301025.vo.QueryApprovalVo;
import com.wondersgroup.local.k3.f10301025.vo.QueryRecheckVO;
import com.wondersgroup.local.k3.f10301025.vs.F10301025VS;
import com.wondersgroup.wssip.local.commons.util.GridUtils;
import com.wondersgroup.wssip.util.BeanTools;

public class F10301025VSImpl implements F10301025VS{
	
	private F10301025BS f10301025bs;
	
	public F10301025BS getF10301025bs() {
		return f10301025bs;
	}

	public void setF10301025bs(F10301025BS f10301025bs) {
		this.f10301025bs = f10301025bs;
	}

	public Map<String, Object> queryReCheck(Page page, QueryRecheckVO queryRecheckVO) {
		
		if (queryRecheckVO == null) {
			
			throw new BusinessException("F30101023VSImpl QueryReCheck is null");
			
		}
		
		CaseInfoDTO queryDto = new CaseInfoDTO();
		
		BeanTools.copyProperties(queryRecheckVO, queryDto);

		Page result = this.getF10301025bs().queryRecheckDetail(page, queryDto);
		
		return GridUtils.getGridData(result);
	}

	public List<QueryApprovalVo> queryData(String aaz318) {
		if ("0" == aaz318) {
			throw new BusinessException("F10301025VSImpl:aaz318 is null");
		}
		return this.getF10301025bs().queryApproalData(aaz318);
	}

	public QueryApprovalVo operateApproval(QueryApprovalVo approvalVo) {
		if (approvalVo == null) {
			throw new BusinessException("CommonVSImpl:传入vo为空");
		}
		if(approvalVo.getAaz318()==null||approvalVo.getAaz318()==0){
			throw new BusinessException("CommonVSImpl:传入稽核案件id为空");
		}
		
		UserContext userContext = BusinessContextUtils.getUserContext();
		String ailmen = userContext.getOperatorName();
		approvalVo.setAilmen(ailmen);
		approvalVo.setAiltime(new Date());
		ApprovalClassList acl = this.getF10301025bs().qryMaxApprovalId();
		if(approvalVo.getAclid().equals(acl.getAclid())){
			 String aae189 = approvalVo.getAilyj();
			 List<Af53DTO> af53Dtos = this.getF10301025bs().findCaseID(approvalVo.getAaz318()+"");

			 //修改审案状态和插入记录
			 for(Af53DTO af53Dto : af53Dtos){
				Af31DTO af31DTO= new Af31DTO();
				
				af31DTO.setAaz318(af53Dto.getAaz318());
				af31DTO.setAaa027(af53Dto.getAaa027());
			
				af31DTO.setAae036(new Date());
				af31DTO.setAae189(aae189);
				if("是".equals(approvalVo.getAiltg())){
					af53Dto.setAae426("4");
				}else if("否".equals(approvalVo.getAiltg())){
					af53Dto.setAae426(af53Dto.getAae427());
				}
				approvalVo.setAilspfl(1);
				//更新审案状态
				this.getF10301025bs().updateAf53(af53Dto);
			}
		}
		return this.getF10301025bs().operateApproval(approvalVo);
	}

	public void jumpOut(String aaz318) {
		this.getF10301025bs().jumpOut(aaz318);
		
	}
}
