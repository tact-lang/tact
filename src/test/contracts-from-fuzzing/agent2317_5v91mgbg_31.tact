struct A {
    one: Int;
}

struct B {
    two: Int;
    a: A;
}

struct C {
    three: Int;
    b: B;
}

contract MultiNest {
    c: C;

    init() {
        self.c = C{three:3, b: B{two:2, a:A{one:1}}};
    }
}