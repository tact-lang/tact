struct S1 {
    a: Int;
}

contract OptStructInitNull {
    foo: S1?;
    init() {
        self.foo = null;
    }
}