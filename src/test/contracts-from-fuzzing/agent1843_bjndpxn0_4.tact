struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    in1: Inner;
    optIn2: Inner?;
}

contract OptionalNestedStruct {
    store: Outer;

    init() {
        self.store = Outer{
            in1: Inner{a: 1, b: true},
            optIn2: null
        };
    }
}
