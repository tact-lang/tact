struct Leaf {
    p: Int;
    q: Bool;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
    l3: Leaf;
}

contract RepeatedNestedStructs {
    storage: Branch;

    init() {
        self.storage = Branch{
            l1: Leaf{p: 1, q: true},
            l2: Leaf{p: 2, q: false},
            l3: Leaf{p: 3, q: true}
        };
    }
}