contract SerializationEdge {
    foo: Int as uint1;
    bar: Int as int1;

    init() {
        self.foo = 1;
        self.bar = -1;
    }
}
