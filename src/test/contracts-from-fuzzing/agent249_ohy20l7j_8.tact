struct Leaf { val: Int }

struct Node {
    l: Leaf;
    optLeaf: Leaf?;
    optInt: Int?;
}

struct Tree {
    left: Node;
    right: Node;
    optNode: Node?;
}

contract TreeStructTest {
    t: Tree;
    optTree: Tree?;

    init() {
        self.t = Tree{
            left: Node{l:Leaf{val:1}, optLeaf:null, optInt:null},
            right: Node{l:Leaf{val:2}, optLeaf:null, optInt:null},
            optNode: null
        };
        self.optTree = null;
    }
}
