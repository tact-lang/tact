contract OptionalNestedStructTest {
    payload: Outer?;

    init() {
        self.payload = null;
    }
}

struct Outer {
    id: Int;
    inner: Inner?;
}

struct Inner {
    comment: String?;
    flag: Bool;
}
