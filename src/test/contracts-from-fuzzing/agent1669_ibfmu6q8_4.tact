struct Leaf {
    data: String?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
    label: String?;    
}

contract OptionalForest {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    nestedTree: Tree;

    init() {
        self.opt1 = null;
        self.opt2 = true;
        self.opt3 = "done";
        self.opt4 = emptyCell();
        self.nestedTree = Tree{
            root: Branch{
                left: Leaf{ data: null },
                right: null,
            },
            label: null,
        };
    }
}