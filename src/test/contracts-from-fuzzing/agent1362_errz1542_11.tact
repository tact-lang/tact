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

contract DeepNesting {
    d: D = D{ c: C{ b: B{ a: A{ x: 42 } } } };
}