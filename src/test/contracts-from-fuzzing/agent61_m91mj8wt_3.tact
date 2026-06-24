struct Nested {
    dummy: Int;
}

struct OptionalDeep {
    inner: Int?;
    nestedOpt: Nested?;
}

contract Test {
    v: OptionalDeep;
    init() {
        self.v = OptionalDeep{ inner: null, nestedOpt: null };
    }
}