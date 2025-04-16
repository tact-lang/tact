struct Leaf { value: Int }

struct Node {
    left: Leaf;
    right: Leaf;
    flag: Bool;
}

struct Tree {
    root: Node;
    flag2: Bool;
}

contract NestedTree {
    data: Tree;

    init() {
        self.data = Tree{
            root: Node{
                left: Leaf{ value: 1 },
                right: Leaf{ value: 2 },
                flag: true
            },
            flag2: false
        };
    }
}
