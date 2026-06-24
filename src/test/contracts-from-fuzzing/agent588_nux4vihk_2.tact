struct Inner {
    a: Int = 1;
    b: Bool?; // optional
}

struct Outer {
    inner: Inner;
    flag: Bool = false;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ a: 100, b: null },
            flag: true
        };
    }

    receive() {
        if (self.data.inner.b != null) {
            let _ = self.data.inner.b!!;
        }
    }
}