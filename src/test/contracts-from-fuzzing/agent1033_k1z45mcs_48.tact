struct A {
    n: Int;
}

contract MultiAssign {
    a: A;
    b: A;
    c: A;
    d: A;

    init() {
        self.a = A{ n: 1 };
        self.b = A{ n: 2 };
        self.c = A{ n: 3 };
        self.d = A{ n: 4 };
    }
}