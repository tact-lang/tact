// Combining deeply nested structs with optional nested fields
struct Leaf {
    leafField: Int?;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

struct Root {
    branch: Branch;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                left: Leaf{leafField: null},
                right: null
            }
        };
    }
}