struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    sub: Branch;
    flag: Bool;
    someText: String;
}

contract TestContract {
    bigTree: Tree;

    init() {
        self.bigTree = Tree{
            root: Branch{left: Leaf{x:1}, right: Leaf{x:2}},
            sub: Branch{left: Leaf{x:3}, right: Leaf{x:4}},
            flag: true,
            someText: "hello"
        };
    }
}