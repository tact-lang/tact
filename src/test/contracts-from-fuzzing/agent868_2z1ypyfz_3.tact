struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract NestedStructs {
    data: C = C{ z: B{ y: A{ x: 42 } } };
}