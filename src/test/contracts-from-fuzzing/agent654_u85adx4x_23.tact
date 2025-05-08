// deeply nested serialization options
struct Leaf {
    value: Int as int64;
}

struct Branch {
    leaf: Leaf;
    count: Int as uint16;
}

struct Tree {
    branch: Branch;
    active: Bool;
}

contract TestContract {
    data: Tree;

    init() {
        self.data = Tree{
            branch: Branch{
                leaf: Leaf{
                    value: -1234567,
                },
                count: 65535,
            },
            active: true,
        };
    }
}