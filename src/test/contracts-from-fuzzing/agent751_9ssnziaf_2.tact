struct Inner { iv: Int; }

struct Outer { inner: Inner; }

contract DeepNestedTest {
    stored: Outer;

    init() {
        self.stored = Outer{ inner: Inner{ iv: 123 } };
    }
}