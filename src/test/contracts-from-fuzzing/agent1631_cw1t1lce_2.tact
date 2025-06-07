struct DeepNest {
    inner: StructInside;
}

struct StructInside {
    x: Int;
    y: Bool;
    z: InnerMost;
}

struct InnerMost {
    flag: Bool;
    note: String;
}

contract TestDeepNested {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{
            inner: StructInside{
                x: 7,
                y: false,
                z: InnerMost{
                    flag: true,
                    note: "hello",
                },
            },
        };
    }
}