trait T {
    foo: Int;
}

contract TestContract with T {
    foo: Int;
    bar: Int;

    init() {
        self.foo = 1;
        self.bar = 2;
    }
}