struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract OptionTreeTest {
    t: Tree;

    init() {
        self.t = Tree{
            root: Branch{
                left: Leaf{ val: 1 },
                right: null
            }
        };
    }

    receive() {
        let _ = self.t;
    }
}