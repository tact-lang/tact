contract DefaultsTest {
    foo: Int = 1;
    bar: String = "bar";
    baz: Bool = false;

    init() {
        self.foo = 10;
        self.bar = "baz";
        self.baz = true;
    }
}