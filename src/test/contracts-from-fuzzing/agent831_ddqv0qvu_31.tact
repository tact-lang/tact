struct InnerU {
    a: Int;
}

contract MutateFields {
    inner: InnerU;

    init() {
        self.inner = InnerU{ a: 5 };
    }

    receive() {
        self.inner.a = self.inner.a + 1;
    }
}