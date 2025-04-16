struct MiddleNested {
    i: Int;
    b: Bool;
}

struct OuterNested {
    m1: MiddleNested;
    m2: MiddleNested;
    s: String;
}

contract NestedStructFields {
    storage: OuterNested;

    init() {
        self.storage = OuterNested{
            m1: MiddleNested{ i: 1, b: true },
            m2: MiddleNested{ i: 2, b: false },
            s: "xyz"
        };
    }
}