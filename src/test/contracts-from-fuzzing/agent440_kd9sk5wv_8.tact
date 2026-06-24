struct Leaf { v: Int?; }

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract TreeOptions {
    root: Root;

    init() {
        self.root = Root{
            branch1: Branch{left: Leaf{v: 1}, right: null},
            branch2: Branch{left: null, right: Leaf{v: 2}},
        };
    }

    receive() {}
}