struct Leaf {
    val: Int?;
    flag: Bool?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract TestContract {
    tree: Branch;

    init() {
        self.tree = Branch{
            left: null,
            right: Leaf{
                val: null,
                flag: true,
            },
        };
    }
}