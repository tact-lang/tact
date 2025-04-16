struct B {
    x: Int;
}

struct A {
    bx: B;
}

struct C {
    ax: A;
}

contract MultiStructs {
    val: C = C{ax: A{bx: B{x: 42}}};
}