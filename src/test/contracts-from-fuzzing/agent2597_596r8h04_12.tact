struct Leaf {
    flag: Bool;
    number: Int;
    text: String;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
    optLeaf: Leaf?;
}

contract MultiLayer {
    b: Branch;

    init() {
        self.b = Branch{
            leaf1: Leaf{flag: true, number: 1, text: "one"},
            leaf2: Leaf{flag: false, number: 2, text: "two"},
            optLeaf: null,
        };
    }
}