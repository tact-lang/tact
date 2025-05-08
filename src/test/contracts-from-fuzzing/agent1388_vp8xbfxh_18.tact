struct S { a: Int; }

contract Test {
    foo: S;

    init() {
        self.foo = S{ a: 42 };
    }
}
