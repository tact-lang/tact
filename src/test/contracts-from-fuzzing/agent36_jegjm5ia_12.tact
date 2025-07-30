struct C {
    x: Int = 42;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract NestedOptionalsAllPresent {
    a: A = A{ b: B{ c: C{} } };
}