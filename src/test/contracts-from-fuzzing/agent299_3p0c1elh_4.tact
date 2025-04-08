struct Inner {
    s: String;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract OptionalNestedStructTest {
    data: Outer;
    init() {
        self.data = Outer{inner: null, flag: true};
    }
}