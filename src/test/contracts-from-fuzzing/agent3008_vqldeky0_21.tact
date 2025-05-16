contract PersistentDefaults {
    foo: Int = 10;
    bar: Bool = false;
    baz: String = "hello";
    opt: Int? = null;

    init() {
        self.foo = 20;
        self.bar = true;
        self.baz = "world";
        self.opt = null;
    }
}