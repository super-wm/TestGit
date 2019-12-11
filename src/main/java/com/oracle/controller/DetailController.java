package com.oracle.controller;

import com.oracle.model.Detail;
import com.oracle.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/detail")
public class DetailController {

    @Autowired
    private DetailService detailService;

    @ResponseBody
    @RequestMapping("/one")
    public String toOne(){
        return "";

    }

    /**
     *  跳转到首页
     * @param request
     * @return
     */
    @RequestMapping("/toIndex")
    public String getAllDetail(HttpServletRequest request){
        List<Detail> detailList = detailService.getAllDetail();
        request.setAttribute("detailList",detailList);
        return "index";
    }

    /**
     * 跳转到详情页面
     * @param request
     * @param detailId
     * @return
     */
    @RequestMapping("/toInfo")
    public String getDetail(HttpServletRequest request,int detailId){

        Detail detail = detailService.getDetail(detailId);
        request.setAttribute("detail",detail);
        return "stationInfo";
    }



    /**
     *  删除
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/detele")
    public String plDetele(HttpServletRequest request){
        String[] id = request.getParameterValues("one");
        List<Integer> list = new ArrayList<>();
        for(int i=0;i<id.length;i++){
            Integer detailId = Integer.parseInt(id[i]);
            list.add(detailId);
        }
        detailService.deteleDetail(list);
        return "chenggong";
    }

}
