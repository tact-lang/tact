struct OptionalInNested {
    a: Int;
    b: InnerOptional?;
}

struct InnerOptional {
    c: Int;
    d: Bool;
}

contract OptNestedContract {
    nested: OptionalInNested;

    init() {
        self.nested = OptionalInNested {
            a: 1,
            b: InnerOptional{ c: 2, d: true }
        };
    }
}