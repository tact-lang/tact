contract DefaultAssignments {
    foo: Int = 0;
    bar: Int = 1;
    baz: Bool = false;

    init() {
        self.foo = 7;
        self.bar = 9;
        self.baz = true;
    }
}
