contract OptionalNestedStructs {
    a: Int;
    b: Inner?;
    init() {
        self.a = 1;
        self.b = null;
    }
}

struct Inner {
    c: Int;
    d: Bool;
}
