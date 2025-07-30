struct A {
    a: Int;
}

struct B {
    a: A;
}

struct C {
    a: B;
}

struct D {
    a: C;
}

struct E {
    a: D;
}

contract Nested5Levels {
    e: E = E{ a: D{ a: C{ a: B{ a: A{ a: 777 } } } } };
}