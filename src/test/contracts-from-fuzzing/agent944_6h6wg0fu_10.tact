struct A {
    aa: Int;
}

struct B {
    ab: A;
}

struct C {
    ac: B;
}

struct D {
    ad: C;
}

contract DeepFourNesting {
    d: D;

    init() {
        self.d = D{
            ad: C{
                ac: B{
                    ab: A{
                        aa: 123
                    }
                }
            }
        };
    }
}