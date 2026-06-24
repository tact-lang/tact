struct Leaf {
    q: Int;
}

struct Node {
    child: Leaf;
    data: String;
}

struct Tree {
    n1: Node;
    n2: Node;
}

contract TestContract {
    root: Tree;

    init() {
        self.root = Tree{
            n1: Node{child: Leaf{q:1}, data:"A"},
            n2: Node{child: Leaf{q:2}, data:"B"}
        };
    }
}