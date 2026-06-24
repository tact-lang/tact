contract SerializationEdge {
    foo: Int as uint255;
    bar: Int as int256;

    init() {
        self.foo = (1 << 255) - 1;
        self.bar = - (1 << 255);
    }

    receive() {}
}