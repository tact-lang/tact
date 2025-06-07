// multiple nested structs with optional layers
struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract LayeredNulls {
    root: Root;
    init() {
        self.root = Root{
            branch: Branch{
                leaf: Leaf{ val: null }
            }
        };
    }
}