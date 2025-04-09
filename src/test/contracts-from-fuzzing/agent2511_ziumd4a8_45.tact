trait T {
    foo: Int;
}

contract MultiInherit with T {
    foo: Int;
    bar: Int;

    init() {
        self.foo = 7;
        self.bar = 8;
    }
}