struct A {
    n: Int;
}

struct B {
    n: Int;
}

struct C {
    a: A;
    b: B;
}

contract MultiStruct {
    s: C;

    init() {
        self.s = C{
            a: A{ n: 1 },
            b: B{ n: 2 }
        };
    }
}