struct BigNested {
    inner1: InnerNested;
    inner2: InnerNested;
}

struct InnerNested {
    x: Int;
    y: Bool;
    z: String;
}

contract ComplexStorage {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            inner1: InnerNested{ x: 1, y: true, z: "test" },
            inner2: InnerNested{ x: 2, y: false, z: "demo" },
        };
    }
}