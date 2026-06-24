contract ChainedAssign {
    foo: Int;
    bar: Int;

    init() {
        self.foo = 1;
        self.bar = self.foo + 2;
    }
}