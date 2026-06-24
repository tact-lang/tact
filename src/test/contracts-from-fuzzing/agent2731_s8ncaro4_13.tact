struct Leaf1 {
    val: Int;
}

struct Leaf2 {
    txt: String;
}

struct Middle {
    l1: Leaf1;
    l2: Leaf2;
}

contract TwoBranchNested {
    branch: Middle;

    init() {
        self.branch = Middle{
            l1: Leaf1{val:42},
            l2: Leaf2{txt:"x"}
        };
    }
}