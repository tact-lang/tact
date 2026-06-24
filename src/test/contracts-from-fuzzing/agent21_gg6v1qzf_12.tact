struct D {
    x: Int;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract Test {
    val: A = A{ b: null };
}