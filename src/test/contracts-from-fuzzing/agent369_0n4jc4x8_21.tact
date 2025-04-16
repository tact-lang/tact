contract ConstAndFields {
    const CONST_VALUE: Int = 100;
    foo: Int;
    bar: Bool;
    baz: String;

    init() {
        self.foo = self.CONST_VALUE;
        self.bar = true;
        self.baz = "hello";
    }
}