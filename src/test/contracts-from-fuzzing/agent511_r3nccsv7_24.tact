contract DeepDefaultsContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "init";

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = "hello";
    }
}