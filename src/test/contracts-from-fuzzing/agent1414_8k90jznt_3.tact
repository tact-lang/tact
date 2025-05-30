struct Leaf {
    value: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch;
}

contract DeepOptionTest {
    root: Root;

    init() {
        self.root = Root {
            branch: Branch {
                leaf: null
            }
        };
    }
}