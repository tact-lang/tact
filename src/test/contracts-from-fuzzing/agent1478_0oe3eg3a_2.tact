struct OptionalInner1 { foo: Int; }

struct OptionalOuter1 {
    maybe: OptionalInner1?;
}

contract OptionalStructField {
    s: OptionalOuter1;

    init() {
        self.s = OptionalOuter1{ maybe: null };
    }
}
