struct Leaf {
    a: Bool = true;
    b: Bool?;
    c: Int?;
}

struct Middle {
    leaf: Leaf;
    name: String = "M";
}

struct Top {
    mid: Middle;
    id: Int = 100;
}

contract DeepOverride {
    stuff: Top;

    init() {
        self.stuff = Top{
            mid: Middle{
                leaf: Leaf{
                    c: 123456
                }
            },
            id: 999
        };
    }

    receive() {}
}