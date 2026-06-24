struct A {
    i: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
    a5: A;
    a6: A;
    a7: A;
    a8: A;
    a9: A;
    a10: A;
}

contract TestContract {
    persistent: B;
    init() {
        self.persistent = B{
            a1: A{ i: 1 },
            a2: A{ i: 2 },
            a3: A{ i: 3 },
            a4: A{ i: 4 },
            a5: A{ i: 5 },
            a6: A{ i: 6 },
            a7: A{ i: 7 },
            a8: A{ i: 8 },
            a9: A{ i: 9 },
            a10: A{ i: 10 }
        };
    }
}