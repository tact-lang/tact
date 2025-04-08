struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract DeepChain {
    c: C = C{ z: B{ y: A{ x: 123 } } };
}