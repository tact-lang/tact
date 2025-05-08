struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

contract DefaultInitChain {
    field: C = C{ z: 7, b: B{ y: 8, a: A{ x: 9 } } };
}