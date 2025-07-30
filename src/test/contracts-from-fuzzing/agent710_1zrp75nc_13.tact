contract SerializedFields {
    foo: Int as uint8;
    bar: Int as int16;
    baz: Int as uint64;

    init() {
        self.foo = 5;
        self.bar = -12;
        self.baz = 987654321;
    }
}