struct OptionalNest {
    inner: Int?;
}

contract OptionalDeep2 {
    foo: OptionalNest?;

    init() {
        self.foo = null;
    }

    receive() {
        self.foo = OptionalNest{inner: 7};
    }
}