struct A {
    v: Int;
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
    val: D;

    init() {
        self.val = D{
            c: C{
                b: B{
                    a: A{v:123}
                }
            }
        };
    }
}
