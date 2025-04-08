contract InitOverridesDef {
    foo: Int = 1;
    bar: Bool = false;

    init() {
        self.foo = 999;
        self.bar = true;
    }
}
