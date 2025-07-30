struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf;
    tag: Bool;
}

struct Tree {
    left: Branch?;
    right: Branch?;
}

contract OptNested {
    content: Tree?;

    init() {
        self.content = Tree{
            left: Branch{ leaf: Leaf{ val: 42 }, tag: true },
            right: null
        };
    }
}
