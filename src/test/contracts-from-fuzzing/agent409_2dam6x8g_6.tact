struct Leaf {
    a: Int;
    b: Bool?;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
    s: String;
}

struct Tree {
    root: Branch;
    child: Branch?;
}

contract Forest {
    data: Tree;

    init() {
        self.data = Tree{
            root: Branch{
                left: Leaf{ a:1, b:null },
                right: null,
                s: "root"
            },
            child: null
        };
    }
}