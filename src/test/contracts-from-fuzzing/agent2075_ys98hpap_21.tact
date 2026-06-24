struct A {
    one: Int;
}

struct B {
    two: A;
}

struct C {
    three: B;
}

struct D {
    four: C;
}

contract FourNestOpt {
    st: D?;

    init() {
        self.st = D{
            four: C{
                three: B{
                    two: A{ one: 1 }
                }
            }
        };
    }
}