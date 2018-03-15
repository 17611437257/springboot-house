package com.jk.service.tree;

import com.jk.mapper.tree.TreeMapper;
import com.jk.model.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreeServiceImpl implements TreeService {
    @Autowired
    private TreeMapper treeMapper;
    @Override
    public List<Tree> queryTree() {
        return treeMapper.queryTree();
    }
}
