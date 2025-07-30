// Test edge case: nested optional inside deeply nested struct hierarchy
struct Leaf {
    value: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            branch: Branch{
                leaf: null,
            }
        };
    }
}