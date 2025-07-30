struct InnerMost {
    z: Int;
    t: Bool;
}

struct Middle {
    nested: InnerMost?;
}

struct Outer {
    nestedMid: Middle?;
}

contract TestStorage {
    nestedOuter: Outer;

    init() {
        self.nestedOuter = Outer{
            nestedMid: Middle{
                nested: InnerMost{
                    z: 5,
                    t: false,
                },
            },
        };
    }
}