struct InnerMost {
    a: Bool?;
    b: Int;
}

struct InnerMid {
    x: InnerMost?;
    y: Int?;
}

struct Outer {
    m: InnerMid?;
    z: String;
}

contract DeepNestedOptionalMixed {
    store: Outer;

    init() {
        self.store = Outer{
            m: null,
            z: "deep",
        };
    }
}