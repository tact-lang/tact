struct Leaf {
    val: Int;
}

struct Node {
    l: Leaf?;
    r: Leaf?;
}

struct Tree {
    left: Node;
    right: Node;
}

contract TreeTest {
    data: Tree;

    init() {
        self.data = Tree{
            left: Node{l:null, r:null},
            right: Node{l:null, r:null}
        };
    }
}