struct NestedWithDefaults {
    inner: Inner;
}

struct Inner {
    foo: Int = 7;
}

contract TestDefaults {
    d: NestedWithDefaults;

    init() {
        self.d = NestedWithDefaults{ inner: Inner{} };
    }
}