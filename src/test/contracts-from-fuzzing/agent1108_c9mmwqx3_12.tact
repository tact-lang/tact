struct Leaf {
    x: Int?;
    y: Bool;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

struct Tree {
    root: Branch;
    extra: String;
}

contract TestContract {
    data: Tree?;

    init() {
        self.data = Tree{
            root: Branch{
                left: Leaf{ x: 1, y: true },
                right: Leaf{ x: 2, y: false }
            },
            extra: "hi"
        };
    }
}