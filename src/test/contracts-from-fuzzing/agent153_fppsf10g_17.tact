struct A {
    a1: Int;
    a2: B;
}

struct B {
    b1: Int;
    b2: C;
}

struct C {
    c1: Int;
}

contract ChainNested {
    data: A;

    init() {
        self.data = A{
            a1:1,
            a2: B{
                b1:2,
                b2: C{c1:3}
            }
        };
    }

    receive() {
        self.data.a2.b2.c1 += 1;
    }
}