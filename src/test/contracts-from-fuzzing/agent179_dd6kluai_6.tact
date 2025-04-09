struct D {
    x: Int? = null;
    y: Bool? = null;
}

struct C {
    d: D = D{};
    s: String? = null;
}

struct B {
    c: C = C{};
    flag: Bool? = null;
}

struct A {
    b: B = B{};
    n: Int? = null;
}

contract TestContract {
    data: A = A{};
}