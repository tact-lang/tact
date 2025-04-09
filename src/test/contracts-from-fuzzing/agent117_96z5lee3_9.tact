struct A {
    val: Int;
}

struct B {
    val: Int;
    a: A;
}

struct C {
    val: Int;
    b: B;
}

contract MultiNest {
    c: C;

    init() {
        self.c = C{val:1, b: B{val:2, a: A{val:3}}};
    }
}