struct Node {
    left: Int;
    right: Int;
    flag: Bool;
}

struct Tree {
    root: Node;
    branch: Node;
    leaf: Node;
}

contract TestContract {
    data: Tree;

    init() {
        self.data = Tree{
            root: Node{ left:1, right:2, flag:true },
            branch: Node{ left:3, right:4, flag:false },
            leaf: Node{ left:5, right:6, flag:true }
        };
    }
}