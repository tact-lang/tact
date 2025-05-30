contract InitOverride {
    foo: Int;
    bar: Bool;
    init() {
        self.foo = 100;
        self.bar = true;
    }
}