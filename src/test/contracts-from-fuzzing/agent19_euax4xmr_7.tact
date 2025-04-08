struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
}

contract Test {
    data: Branch;

    init() {
        self.data = Branch{
            leaf: Leaf{
                val: null,
            },
        };
    }
}