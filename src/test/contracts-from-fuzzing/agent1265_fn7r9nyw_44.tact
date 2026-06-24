struct Leaf {
    name: String;
}

struct Branch {
    leafA: Leaf;
    leafB: Leaf;
}

contract TreeStructTest {
    tree: Branch;

    init() {
        self.tree = Branch{
            leafA: Leaf{name:"A"},
            leafB: Leaf{name:"B"}
        };
    }
}