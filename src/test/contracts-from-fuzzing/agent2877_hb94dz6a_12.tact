struct A {
    a: Int;
}

struct B {
    a: Int;
    aa: A;
}

struct C {
    a: Int;
    bb: B;
}

contract Disorder {
    c: C;

    init() {
        self.c = C{
            a: 1,
            bb: B{
                a: 2,
                aa: A{
                    a: 3
                }
            }
        };
    }
}