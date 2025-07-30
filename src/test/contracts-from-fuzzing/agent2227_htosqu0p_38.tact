struct Leaf {
    name: String;
}
struct Branch {
    child: Leaf;
}
struct Tree {
    root: Branch;
}

contract TreeStorage {
    bigTree: Tree;

    init() {
        self.bigTree = Tree{ root: Branch{ child: Leaf{ name: "root" } } };
    }
}