struct Leaf {
    name: String?;
}

struct Branch {
    leaf: Leaf?;
    count: Int;
}

struct Tree {
    branch: Branch?;
}

contract Test {
    data: Tree;

    init() {
        self.data = Tree{
            branch: Branch{
                count: 10,
            }
        };
    }
}