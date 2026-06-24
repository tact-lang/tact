struct DoubleOptional {
    a: Int?;
    b: Bool?;
}

contract OptsInStructAndField {
    inner: DoubleOptional?;

    init() {
        self.inner = null;
    }

    receive() {
        let _ = self.inner;
    }
}
