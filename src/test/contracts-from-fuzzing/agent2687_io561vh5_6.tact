struct Inner {
    value: Int?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalNestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{ inner: null };
    }
}