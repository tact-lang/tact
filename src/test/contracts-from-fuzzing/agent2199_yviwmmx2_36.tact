contract InitOptionalNested {
    b: Inner?;
    init() {
        self.b = Inner{c: 10, d: true};
    }
}

struct Inner {
    c: Int;
    d: Bool;
}
