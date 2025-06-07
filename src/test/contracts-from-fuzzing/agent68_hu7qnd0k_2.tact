struct Leaf { value: Int; }

struct Branch {
    left: Int;
    right: Int;
    leafOpt: Leaf?;
}

struct TreeHolder {
    tree: Branch;
}

contract DeepOptStruct {
    state: TreeHolder;

    init() {
        self.state = TreeHolder{
            tree: Branch{
                left: 7,
                right: 8,
                leafOpt: null
            }
        };
    }
}
