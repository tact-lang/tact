struct LargeNested {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: InnerLarge;
}

struct InnerLarge {
    x1: Int;
    x2: String;
    x3: Bool;
    x4: Deeper;
}

struct Deeper {
    y1: Bool;
    y2: String;
    y3: Int;
}

contract LargeNestedContract {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            f1: 1,
            f2: false,
            f3: "layer1",
            f4: InnerLarge{
                x1: 2,
                x2: "layer2",
                x3: true,
                x4: Deeper{
                    y1: false,
                    y2: "layer3",
                    y3: 3,
                },
            },
        };
    }
}