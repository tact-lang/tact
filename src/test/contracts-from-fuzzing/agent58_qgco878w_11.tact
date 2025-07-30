struct InnerDef {
    a: Int = 10;
    b: Bool = false;
}

struct Outer {
    inner1: InnerDef;
    inner2: InnerDef;
}

contract NestedDefaults {
    top: Outer;

    init() {
        self.top = Outer{
            inner1: InnerDef{ a: 42, b: true },
            inner2: InnerDef{},
        };
    }
}