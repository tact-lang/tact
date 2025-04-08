struct A {
    x: Int;
    y: Int;
}

struct B {
    wrapped: A?;
}

struct C {
    inner: B;
}

contract OptionalStructWrapped {
    s: C;

    init() {
        self.s = C{
            inner: B{ wrapped: null }
        };
    }
}