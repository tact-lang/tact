struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

struct E {
    d: D;
}

contract OptionalDeep {
    foo: E?;
    bar: Int;

    init() {
        self.foo = null;
        self.bar = 1;
    }
}