struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c1: A;
    c2: B;
}

contract MultiStructSingleField {
    data: C;

    init() {
        self.data = C{
            c1: A{ a: 1 },
            c2: B{ b: 2 }
        };
    }
}