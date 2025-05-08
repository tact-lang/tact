// Cross-linked varied optional and non-optional deeply nested structs

struct Leaf {
    leafVal: Int;
    optStr: String?;
}

struct Node {
    left: Leaf?;
    right: Leaf;
    flag: Bool;
}

struct Tree {
    rootNode: Node;
    sideNode: Node?;
}

contract TestContract {
    t: Tree;

    init() {
        self.t = Tree{
            rootNode: Node{
                left: null,
                right: Leaf{
                    leafVal: 17,
                    optStr: null,
                },
                flag: true,
            },
            sideNode: Node{
                left: Leaf{
                    leafVal: 999,
                    optStr: "z",
                },
                right: Leaf{
                    leafVal: 888,
                    optStr: "y",
                },
                flag: false,
            },
        };
    }
}
