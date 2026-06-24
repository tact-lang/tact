struct Inner { a: Int; b: Int?; }

struct Outer { inner: Inner; c: Int; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ a: 1, b: null },
            c: 42
        };
    }
}