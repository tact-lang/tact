struct Leaf {
    foo: String;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    b1: Branch;
    b2: Branch;
}

contract TreeStore {
    tr: Root;

    init() {
        self.tr = Root{
            b1: Branch{l1:Leaf{foo:"a"}, l2:Leaf{foo:"b"}},
            b2: Branch{l1:Leaf{foo:"c"}, l2:Leaf{foo:"d"}},
        };
    }
}