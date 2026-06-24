struct Inner { mandatory: Int; }

struct Outer { inner: Inner?; }

contract OptionalFieldWithNonDefaultInner {
    state: Outer;

    init() {
        self.state = Outer{ inner: null };
    }
}