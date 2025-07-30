struct Leaf {
    a: Int = 1;
    b: Bool?;
    c: String = "leaf";
}

struct Middle {
    leaf: Leaf;
    x: Int?;
    y: Bool = false;
}

struct Root {
    middle: Middle;
    rootVal: String;
}

contract DeepMixedNested {
    storage: Root;

    init() {
        self.storage = Root{
            middle: Middle{
                leaf: Leaf{
                    b: null,
                },
                x: null,
            },
            rootVal: "root",
        };
    }
}
