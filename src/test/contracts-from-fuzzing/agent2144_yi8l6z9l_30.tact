contract DuplicatedNames {
    foo: Int;
    bar: Int;
    foo2: Int;
    bar2: Int;

    init() {
        self.foo = 1;
        self.bar = 2;
        self.foo2 = 3;
        self.bar2 = 4;
    }
}
