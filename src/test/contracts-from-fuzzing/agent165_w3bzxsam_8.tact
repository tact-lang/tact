struct Leaf { val: Int }

struct Node {
    left: Leaf; 
    right: Leaf; 
}

struct Tree {
    root: Node; 
    height: Int; 
}

contract TreeHolder {
    t: Tree;

    init() {
        self.t = Tree{
            root: Node{ left: Leaf{val: 1}, right: Leaf{val: 2} },
            height: 1
        };
    }
}