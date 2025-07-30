struct Leaf {
    foo: Int?;
    bar: String?;
}

struct Node {
    child: Leaf?;
    num: Int;
}

struct Tree {
    root: Node?;
    flag: Bool;
}

contract StructDeepPersistent {
    data: Tree;

    init() {
        self.data = Tree{
            root: Node{
                child: null,
                num: 11,
            },
            flag: true,
        };
    }
}