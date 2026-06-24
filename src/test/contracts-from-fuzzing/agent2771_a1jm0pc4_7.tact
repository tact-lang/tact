struct Inner {
    inside: Int;
}

struct Outer {
    wrapped: Inner;
    maybeWrapped: Inner?;
}

contract ComplexNested {
    bundle: Outer;

    init() {
        self.bundle = Outer{
            wrapped: Inner{inside: 42},
            maybeWrapped: null
        };
    }
}