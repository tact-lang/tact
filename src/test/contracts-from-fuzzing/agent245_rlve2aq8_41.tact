contract FieldOmittedInitTest {
    foo: Int;
    bar: Bool = false;
    baz: String;

    init() {
        self.foo = 7;
        self.baz = "hello";
    }
}