struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

contract TestContract {
    c: C;

    init() {
        self.c = C{
            z: 9,
            b: B{
                y: 8,
                a: A{
                    x: 7
                }
            }
        };
    }

    receive() {
        self.c = self.c;
    }
}