struct S {
    foo: Int = 1;
    bar: Int = 2;
    baz: Int = 3;
}

contract Test {
    s: S;
    init() {
        self.s = S{};
    }
}