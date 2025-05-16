struct Leaf {
    x: Int;
    y: Bool;
}

struct Middle {
    name: String;
    leaf: Leaf;
}

struct Root {
    count: Int;
    mid: Middle;
}

contract DeepComposite {
    data: Root;

    init() {
        self.data = Root{
            count: 99,
            mid: Middle{
                name: "deep",
                leaf: Leaf{x: 42, y: false}
            }
        };
    }
}