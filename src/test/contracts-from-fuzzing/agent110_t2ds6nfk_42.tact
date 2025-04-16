struct A {
    x: Int?;
}

contract TestOpt {
    foo: A?;
    bar: A;

    init() {
        self.foo = null;
        self.bar = A{x: null};
    }
}