struct D {
    val: Int = 5;
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

contract TopDefaults {
    data: A = A{};
}
