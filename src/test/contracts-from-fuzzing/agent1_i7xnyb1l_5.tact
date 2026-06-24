struct Leaf {
    x: Int?;
}

struct Middle {
    leaf: Leaf;
    flag: Bool;
}

struct Root {
    m: Middle;
    desc: String;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            m: Middle{
                leaf: Leaf{
                    x: 123,
                },
                flag: true,
            },
            desc: "deep",
        };
    }
}