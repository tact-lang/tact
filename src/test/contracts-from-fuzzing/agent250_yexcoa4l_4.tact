struct Leaf {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Branch {
    leaf1: Leaf?;
    leaf2: Leaf?;
}

struct Tree {
    branch1: Branch?;
    branch2: Branch?;
}

contract Test {
    data: Tree;

    init() {
        self.data = Tree{
            branch1: Branch{
                leaf1: Leaf{ x: 1, y: null, z: "hello" },
                leaf2: null
            },
            branch2: null
        };
    }
}