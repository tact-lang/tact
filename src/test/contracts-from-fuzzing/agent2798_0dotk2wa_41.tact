contract SelfReferenceOptional {
    foo: Int?;
    bar: Bool;
    baz: Int as int32;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = -100;
    }
}