struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Branch {
    leaf: Leaf;
    str: String = "";
}

contract Tree {
    branch: Branch;

    init() {
        self.branch = Branch{
            leaf: Leaf{
                a: 123
            }
        };
    }
}
