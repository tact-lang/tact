struct Inner {
    value: String?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalStructTest {
    storage: Outer;

    init() {
        self.storage = Outer{ inner: Inner{ value: null } };
    }
}