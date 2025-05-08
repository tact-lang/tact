struct DeepNested {
    a: Int;
    b: InnerNested;
    c: Bool;
}

struct InnerNested {
    x: Int;
    y: InnerMost;
}

struct InnerMost {
    m: Int;
    n: Bool;
}

contract ComplexNest {
    store: DeepNested;

    init() {
        self.store = DeepNested{
            a: 1,
            b: InnerNested{
                x: 2,
                y: InnerMost{
                    m: 3,
                    n: true,
                }
            },
            c: false,
        };
    }
}