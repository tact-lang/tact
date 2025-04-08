struct A {
    xa: Int;
}

struct B {
    xb: Int;
}

struct C {
    xc: Int;
}

contract LargeComposite {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ xa: 1 };
        self.b = B{ xb: 2 };
        self.c = C{ xc: 3 };
    }

    receive() {
        let _ = self.a.xa + self.b.xb + self.c.xc;
    }
}