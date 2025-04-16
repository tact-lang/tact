struct NestedOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptStructInside {
    inner: NestedOpts?;

    init() {
        self.inner = null;
    }
}
