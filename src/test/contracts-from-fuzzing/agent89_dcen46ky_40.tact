contract Fuzz40 {
    foo: Int;
    bar: Int = 5;
    baz: Int;

    init() {
        self.foo = 1;
        self.baz = 2;
    }
}