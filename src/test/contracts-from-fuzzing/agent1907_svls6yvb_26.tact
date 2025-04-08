contract SerializeOutOfRange {
    foo: Int as uint8;

    init() {
        self.foo = 300;
    }
}