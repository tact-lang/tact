struct Leaf {
    x: Int?;
    y: String;
}

struct Middle {
    m: Bool?;
    leaf: Leaf;
}

struct Root {
    rootA: Int;
    mid: Middle;
}

contract DeepNest {
    persistent: Root;

    init() {
        self.persistent = Root{
            rootA: 99,
            mid: Middle{
                m: null,
                leaf: Leaf{
                    x: null,
                    y: "yyy",
                },
            },
        };
    }
}