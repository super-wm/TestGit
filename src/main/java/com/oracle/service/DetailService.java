package com.oracle.service;

import com.oracle.mapper.DetailMapper;
import com.oracle.mapper.StationMapper;
import com.oracle.model.Detail;
import com.oracle.model.DetailExample;
import com.oracle.model.Station;
import com.oracle.model.StationExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DetailService {

    @Autowired
    private DetailMapper detailMapper;

    @Autowired
    private StationMapper stationMapper;

    /**
     *  查询所有
     * @return
     */
    public List<Detail> getAllDetail(){

        DetailExample e1 = new DetailExample();
        return detailMapper.selectByExample(e1);

    }

    /**
     *  根据id查找
     * @param detailId
     * @return
     */
    public Detail getDetail(int detailId){
        Detail detail = detailMapper.selectByPrimaryKey(detailId);
        StationExample e1 = new StationExample();
        StationExample.Criteria c1 = e1.createCriteria();
        c1.andDetailIdEqualTo(detailId);
        List<Station> stationList = stationMapper.selectByExample(e1);
        detail.setStationList(stationList);
        return detail;
    }

    /**
     *  删除
     * @param list
     */
    public void deteleDetail(List<Integer> list){
        stationMapper.deleteStation(list);

        detailMapper.deleteDetail(list);
    }




}
