struct SNested {
    a: Int;
    b: Bool;
}

trait TNested {
    inner: SNested;
}

contract NestedTraitFields with TNested {
    inner: SNested;
    init() {
        self.inner = SNested{a: 99, b: false};
    }
    receive() {
        let _ = self.inner.b;
    }
}