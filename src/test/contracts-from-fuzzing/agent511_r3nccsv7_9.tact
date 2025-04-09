struct Leaf {
    foo: Int;
    bar: Bool;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
}

contract WideTree {
    branchA: Branch;
    branchB: Branch;

    init() {
        self.branchA = Branch{
            leaf1: Leaf{ foo: 1, bar: true },
            leaf2: Leaf{ foo: 2, bar: false }
        };
        self.branchB = Branch{
            leaf1: Leaf{ foo: 3, bar: false },
            leaf2: Leaf{ foo: 4, bar: true }
        };
    }
}