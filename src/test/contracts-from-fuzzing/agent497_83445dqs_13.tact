struct Leaf {
    value: Int;
    label: String;
}

struct Branch {
    left: Leaf;
    right: Leaf;
    info: String;
}

struct Tree {
    root: Branch;
    note: String;
    flag: Bool;
}

contract TreeStorage {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{
                left: Leaf{value:1,label:"L"},
                right: Leaf{value:2,label:"R"},
                info: "root branch"
            },
            note: "full tree",
            flag: true
        };
    }
}