struct Leaf {
    i: Int;
    j: Int?;
}

contract NullableLeaves {
    l1: Leaf?;
    l2: Leaf?;
    l3: Leaf?;

    init() {
        self.l1 = null;
        self.l2 = Leaf{i:1, j:null};
        self.l3 = Leaf{i:2, j:3};
    }
}
