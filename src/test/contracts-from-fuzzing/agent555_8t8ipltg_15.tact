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
    num: Int;
    optBool: Bool?;
    optAddr: Address?;
}

contract ComplexNest {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            num: 123,
                            optBool: null,
                            optAddr: null,
                        }
                    }
                }
            }
        };
    }
}