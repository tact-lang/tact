struct D {
    z: Int = 7;
}

struct C {
    d: D = D{};
}

struct B {
    c: C = C{};
}

struct A {
    b: B = B{};
}

contract TestContract {
    a: A = A{};
}