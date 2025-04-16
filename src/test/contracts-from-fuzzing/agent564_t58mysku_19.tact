// Multi-level struct nesting with varied types
struct Leaf {
    n: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
    flag: Bool;
}

struct Tree {
    root: Branch;
    label: String;
}

contract TreeStore {
    t: Tree;
    init() {
        self.t = Tree {
            root: Branch {
                left: Leaf{ n: 1 },
                right: Leaf{ n: 2 },
                flag: false
            },
            label: "oak"
        };
    }

    receive() {
        if (!self.t.root.flag) {
            self.t.root.left.n += 1;
        }
    }
}