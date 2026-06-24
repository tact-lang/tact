struct InnerA {
    p: Int;
}

struct InnerB {
    q: Int?;
}

struct Both {
    a: InnerA?;
    b: InnerB?;
}

contract OptionalNestedStructs {
    state: Both;

    init() {
        self.state = Both{
            a: InnerA{ p: 1 },
            b: null,
        };
    }
}
