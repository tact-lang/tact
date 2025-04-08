contract StructInOptional {
    foo: Inner?;

    init() {
        self.foo = null;
    }
}

struct Inner {
    a: Int;
    b: Bool;
}
