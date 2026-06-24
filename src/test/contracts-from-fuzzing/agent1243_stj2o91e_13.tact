struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
}

struct C {
    b1: B;
    b2: B;
}

contract TestContract {
    c: C;

    init() {
        self.c = C{
            b1: B{ a1: A{ x: 1 }, a2: A{ x:2 }, a3: A{ x: 3 } },
            b2: B{ a1: A{ x: 4 }, a2: A{ x:5 }, a3: A{ x: 6 } },
        };
    }

    receive() {
        dump(self.c.b1.a1.x);
    }
}