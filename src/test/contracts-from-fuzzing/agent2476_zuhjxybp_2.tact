struct InnerNested {
    z1: Bool;
    z2: String;
}

struct Nested {
    y1: Int;
    y2: Bool?;
    y3: InnerNested;
}

contract DeepNest {
    s: Nested;
    init() {
        self.s = Nested{
            y1: 10,
            y2: null,
            y3: InnerNested{
                z1: true,
                z2: "str",
            },
        };
    }
}