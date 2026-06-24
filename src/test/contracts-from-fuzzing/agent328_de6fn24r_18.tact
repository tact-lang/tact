struct S {
    a: Int;
    b: Bool;
}

contract Test {
    foo: S?;
    init() {
        self.foo = null;
    }
}