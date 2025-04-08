struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract TestContract {
    nested: C = C{z: B{y: A{x:42}}};
}