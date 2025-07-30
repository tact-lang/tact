struct C {
    x: Int = 1;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract NestedOptionalsNull {
    a: A = A{ b: null };
}