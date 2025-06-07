struct Outer {
    inner: Inner;
}

struct Inner {
    s: String?;
}

contract OptionalNestedDefault {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ s: null } };
    }
}