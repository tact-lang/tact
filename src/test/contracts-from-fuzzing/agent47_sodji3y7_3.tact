struct Inner { a: Int; }

struct Outer { inner: Inner; b: Int; }

contract TestContract {
    stored: Outer;

    init() {
        self.stored = Outer{
            inner: Inner{a: 10},
            b: 20,
        };
    }
}