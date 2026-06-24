struct Leaf {
    value: Int;
}

struct Middle1 {
    left: Leaf;
    right: Leaf;
}

struct Middle2 {
    up: Leaf;
    down: Leaf;
}

struct Tree {
    m1: Middle1;
    m2: Middle2;
}

contract TreeContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            m1: Middle1{ left: Leaf{value: 1}, right: Leaf{value: 2} },
            m2: Middle2{ up: Leaf{value: 3}, down: Leaf{value: 4} }
        };
    }
}