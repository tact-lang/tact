struct OptionalDeep {
    foo: Inner?;
}

struct Inner {
    bar: Nested?;
}

struct Nested {
    baz: String?;
}

contract OptionalDeepContract {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{foo: null};
    }
}