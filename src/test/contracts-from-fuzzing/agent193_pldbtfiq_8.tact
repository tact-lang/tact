struct Leaf {
    a: Int?;
    b: Bool?;
    c: String;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf?;
}

contract Tree {
    branch1: Branch;

    init() {
        self.branch1 = Branch{
            leaf1: Leaf{a: null, b: true, c: "x"},
            leaf2: null
        };
    }
}