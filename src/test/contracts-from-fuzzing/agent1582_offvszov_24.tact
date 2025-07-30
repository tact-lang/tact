struct A {
    value: Int;
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

contract DeepFour {
    d: D = D {
        c: C {
            b: B {
                a: A {
                    value: 1
                }
            }
        }
    };
    receive() {}
}