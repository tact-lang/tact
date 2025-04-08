struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf;
}

contract ManyNestedLayers {
    lvl1: Branch;
    lvl2: Branch;
    lvl3: Branch;

    init() {
        self.lvl1 = Branch{ leaf: Leaf{ val:1 } };
        self.lvl2 = Branch{ leaf: Leaf{ val:2 } };
        self.lvl3 = Branch{ leaf: Leaf{ val:3 } };
    }
}