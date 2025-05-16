struct NestedOpt {
    x: Int?
}

struct DoubleNested {
    inner: NestedOpt
}

contract WithDoubleNestedOpt {
    n: DoubleNested;

    init() {
        self.n = DoubleNested{inner: NestedOpt{x: null}};
    }
}