struct Leaf {
    t: String;
    f: Bool;
}

struct Branch {
    l1: Leaf;
    l2: Leaf?;
    t: String?;
}

contract Test {
    b: Branch;

    init() {
        self.b = Branch{
            l1: Leaf{t:"hello",f:true},
            l2: null,
            t: null,
        };
    }
}
