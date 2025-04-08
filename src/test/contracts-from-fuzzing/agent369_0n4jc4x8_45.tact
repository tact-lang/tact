contract OptSerMix {
    foo: Int? as int32;
    bar: Int? as int64;
    baz: Int?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}