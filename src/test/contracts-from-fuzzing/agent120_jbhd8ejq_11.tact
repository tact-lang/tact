struct A {
    val: Int as int64;
}

struct B {
    val: Int as uint64;
}

struct C {
    a: A;
    b: B;
    c: Int as coins;
}

contract Test {
    nested: C = C{
        a: A{val: -50},
        b: B{val: 50},
        c: 1000000,
    };
}