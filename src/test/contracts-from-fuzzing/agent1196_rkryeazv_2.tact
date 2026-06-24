struct InnerMost {
    a: Int;
    b: Int?;
    c: Bool;
}

struct MidLevel {
    x: String;
    y: Slice;
    z: InnerMost;
    opt: InnerMost?;
}

contract NestedLayers {
    level: MidLevel;

    init() {
        self.level = MidLevel{
            x: "foo",
            y: emptyCell().asSlice(),
            z: InnerMost{
                a: 1,
                b: null,
                c: true,
            },
            opt: null,
        };
    }
}
