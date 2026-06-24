// Very small contract with deeply nested optionals and all null
struct Deep {
    a: A?;
}

struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: D?;
}

struct D {
    e: Int?;
}

contract Test {
    deep: Deep = Deep{
        a: null
    };

    init() {}
}