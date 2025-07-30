struct A {
    i: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract TopLevel {
    field: C;
    init() {
        self.field = C{ b: B{ a: A{ i: 42 } } };
    }
}