// Contract with deep tree of structs containing optionals and nested types

struct Leaf {
    val: Int?;
    active: Bool?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract DeepTree {
    root: Root;

    init() {
        self.root = Root{
            branch1: Branch{ left: Leaf{ val:10, active:null }, right: null },
            branch2: Branch{ left: null, right: Leaf{ val:null, active: true } }
        };
    }
}
