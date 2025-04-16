struct DeepNested {
    layer: Outer;
    active: Bool;
}

struct Inner {
    value1: Int;
    value2: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestDeepNested {
    store: DeepNested;

    init() {
        self.store = DeepNested{
            layer: Outer{
                nested: Inner{value1: 42, value2: 99},
                flag: false
            },
            active: true
        };
    }
}
