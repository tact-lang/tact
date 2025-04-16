contract IntSerializationDefaults {
    foo: Int as uint4;
    bar: Int as int8;

    init() {
        self.foo = 7;
        self.bar = -7;
    }
}