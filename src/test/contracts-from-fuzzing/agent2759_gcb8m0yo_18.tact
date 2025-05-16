struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    a: A;
    b: B;
}

contract ComposeStructs {
    field: C;

    init() {
        self.field = C{
            a: A{a:1},
            b: B{b:2}
        };
    }
}