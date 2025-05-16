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

contract DeeplyNested {
    data: E;

    init() {
        self.data = E{ d: D{ c: C{ b: B{ a: A{ x: 99 } } } } };
    }
}