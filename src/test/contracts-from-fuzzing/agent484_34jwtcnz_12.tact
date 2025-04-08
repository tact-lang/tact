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
    e: E;
}

struct E {
    value: Int;
}

contract Chain {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        e: E{value: 11}
                    }
                }
            }
        };
    }
}