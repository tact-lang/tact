struct Leaf {
    val: Int?;
}

struct Branch {
    a: Leaf?;
    b: Leaf?;
}

struct Root {
    left: Branch?;
    right: Branch?;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            left: Branch{
                a: null,
                b: null
            },
            right: null
        };
    }
}