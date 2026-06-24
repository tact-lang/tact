struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    z: Inner;
    w: String;
}

struct Outer {
    mid: Middle?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                z: Inner{ x: 11, y: true },
                w: "text",
            }
        };
    }
}
