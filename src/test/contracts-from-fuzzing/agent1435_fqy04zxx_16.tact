struct A {
    a: Int;
}

struct B {
    b: Int;
    inner: A;
}

struct C {
    c: Int;
    innerB: B;
}

contract CBinder {
    field: C;

    init() {
        self.field = C{
            c: 1,
            innerB: B{
                b: 2,
                inner: A{ a: 3 }
            }
        };
    }
}