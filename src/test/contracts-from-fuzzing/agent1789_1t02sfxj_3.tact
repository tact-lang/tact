struct Nested {
    inner: Inner;
    flag: Bool = true;
}

struct Inner {
    a: Int = 5;
    b: Bool = false;
}

contract TestContract {
    data: Nested = Nested{ inner: Inner{}, flag: false };

    init() {
        self.data = Nested{
            inner: Inner{ a: 9, b: true },
            flag: true
        };
    }

    receive() {
        let _ = self.data.inner.a + (self.data.inner.b ? 1 : 0) + (self.data.flag ? 2 : 0);
    }
}