package com.wondersgroup.bc.k5.f10506003.bs;

import java.util.List;

import com.wondersgroup.bc.medicarecostaudit.medaudit.model.dto.Kc63DTO;
import com.wondersgroup.bc.medicarecostaudit.medaudit.model.dto.Kc72DTO;
import com.wondersgroup.framework.core.bo.Page;
import com.wondersgroup.local.k2.f10203002.vo.Kc62VO;
import com.wondersgroup.local.k5.f10506003.vo.QueryNumberVO;

public interface F10506003BS {
	/**
	 * 分页查询违规单据统计表
	 * 
	 * @param page
	 * @param kc63Dto
	 * @return
	 */
	Page queryKc63WithPage(Page page, Kc63DTO kc63Dto);
	/**
	 * 根据多个baz001分页查询违规单据明细统计表
	 * 
	 * @param page
	 * @param kc62Dto
	 * @return
	 */
	Page queryKc62sWithPage(Page page, Kc62VO queryDto);
	/**
	 * 根据主键查询违规单据统计表
	 * 
	 * @param baz001
	 * @return
	 */
	Kc63DTO getKc63ById(String baz001);
	/**
	 * 查询单据明细违规信息表
	 * 
	 * @param kc72Dto
	 * @return
	 */
	List<Kc72DTO> queryKc72(Kc72DTO kc72Dto);
	/**
	 * 根据医院编号或医院名称查找
	 * @param yybh
	 * @return
	 */
	List<QueryNumberVO> getQueryNumberVO(String yybh);
}
