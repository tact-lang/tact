struct Leaf {
    i: Int;
    b: Bool;
}

struct BranchA {
    l1: Leaf;
    l2: Leaf;
}

struct BranchB {
    l3: Leaf;
    l4: Leaf;
}

struct Root {
    a: BranchA;
    b: BranchB;
    c: Bool?;
}

contract TreeCtrl {
    data: Root;

    init() {
        self.data = Root{
            a: BranchA{l1: Leaf{i:1,b:true}, l2: Leaf{i:2,b:false}},
            b: BranchB{l3: Leaf{i:3,b:true}, l4: Leaf{i:4,b:false}},
            c: null,
        };
    }
}
