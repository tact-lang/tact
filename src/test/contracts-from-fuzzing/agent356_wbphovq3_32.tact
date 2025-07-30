struct D {
    val: String;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract StringDeep {
    s: A;

    init() {
        self.s = A{
            b: B{
                c: C{
                    d: D{
                        val: "deep"
                    }
                }
            }
        };
    }
}