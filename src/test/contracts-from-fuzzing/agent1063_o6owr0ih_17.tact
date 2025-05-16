struct WithOptions {
    inner: Int?;
    text: String?;
    boolOpt: Bool?;
}

struct Outer {
    nested: WithOptions?;
    number: Int;
}

contract OptNestedStruct {
    f: Outer;

    init() {
        self.f = Outer {
            nested: null,
            number: 42
        };
    }
}