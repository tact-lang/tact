struct Leaf {
    num: Int;
}

struct Mid1 {
    leaf: Leaf;
}

struct Mid2 {
    leaf: Leaf;
}

contract BranchMulti {
    x: Mid1 = Mid1{leaf: Leaf{num:10}};
    y: Mid2 = Mid2{leaf: Leaf{num:20}};
}