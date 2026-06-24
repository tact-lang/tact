struct A {
    x: Int = 1;
}

struct B {
    a: A = A{};
}

struct C {
    b: B = B{};
}

contract NestedDefaultsChain {
    val: C = C{};
}