struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    val: Int;
}

contract Storage {
    st: A;

    init() {
        self.st = A{
            b: B{
                c: C{
                    d: D{ val: 777 }
                }
            }
        };
    }
}