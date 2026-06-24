struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract FourLayer {
    deep: D;

    init() {
        self.deep = D{
            c: C{
                b: B{
                    a: A{
                        x: 999
                    }
                }
            }
        };
    }
}