struct S { a: Int; }

contract Test {
    foo: S?;

    get fun getFoo(): S? {
        return self.foo;
    }
}
