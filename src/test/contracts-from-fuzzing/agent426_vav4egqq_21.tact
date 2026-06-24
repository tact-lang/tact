trait T {
    foo: Int;
}

contract TestContract with T {
    foo: Int;
    bar: Int;
    baz: Bool;

    init() {
        self.foo = 1;
        self.bar = 2;
        self.baz = true;
    }
}