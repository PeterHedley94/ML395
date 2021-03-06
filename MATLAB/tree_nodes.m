function [out_nodes, out_labels] = tree_nodes(tree, root_id)
% Function to return nodes and labels for corresponding sub-trees
    out_nodes = [root_id];
    
    if tree.op ~= -1
        out_labels = tree.op;
    else
        if tree.class == 1
            out_labels = -1;
        else
            out_labels = -2;
        end
    end
    % Recurve through the tree appending to the vector of nodes
    if not(isempty(tree.kids))
        [n1,l1] = tree_nodes(tree.kids(1), root_id+1);
        [n2,l2] = tree_nodes(tree.kids(2), root_id+1);
        n2 = n2 + length(n1);
        n2(1) = n2(1) - length(n1);
        out_nodes = [out_nodes, n1, n2];
        out_labels = [out_labels, l1,l2];
    end
    
end

