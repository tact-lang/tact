struct InnerOptional {
    v: Int?;
}

contract NestedOptionalField {
    inner: InnerOptional;

    init() {
        self.inner = InnerOptional{ v: null };
    }

    receive() {
        if (self.inner.v != null) {
            self.inner.v = self.inner.v!! + 1;
        } else {
            self.inner.v = 0;
        }
    }
}