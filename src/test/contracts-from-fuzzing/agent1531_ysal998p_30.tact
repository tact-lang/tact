trait T {
    foo: Int;
}

contract UseTrait with T {
    foo: Int;
    init() {
        self.foo = 1;
    }
}
