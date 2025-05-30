contract NullableStructFields {
    foo: NullableInner?;

    init() {
        self.foo = null;
    }
}

struct NullableInner {
    a: Int?;
    b: Bool?;
}