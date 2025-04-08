struct Leaf {
    v1: Int;
    v2: Bool?;
    v3: String?;
}

struct Branch {
    leaf: Leaf?;
}

contract ComplexNestedStorage {
    data: Branch;

    init() {
        self.data = Branch{
            leaf: Leaf{
                v1: 99,
                v2: true,
                v3: "hi",
            }
        };
    }
}
