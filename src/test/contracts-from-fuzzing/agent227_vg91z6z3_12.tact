struct Leaf {
    v: Int;
}

struct Middle {
    leaf: Leaf;
    flag: Bool;
}

struct Root {
    mid: Middle;
    label: String;
}

contract DeepHierarchy {
    root: Root;

    init() {
        self.root = Root{
            mid: Middle{
                leaf: Leaf{ v: 77 },
                flag: true,
            },
            label: "deep",
        };
    }

    receive() {
        let _ = self.root.mid.leaf.v;
    }
}
