contract NullablePersistent {
    data: Foo?;
    init() {
        self.data = null;
    }
}

struct Foo {
    val: Int;
}
