struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract TestContract {
    c: C = C{ b: B{ a: A{ x: 42 } } };
}
