struct S {
    a: Int;
}

contract OverwriteTest {
    foo: S;

    init() {
        self.foo = S{ a: 1 };
        self.foo = S{ a: 2 };
    }
}