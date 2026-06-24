struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

struct D {
    w: C;
}

contract Deepest {
    val: D;

    init() {
        self.val = D{
            w: C{
                z: B{
                    y: A{
                        x: 99
                    }
                }
            }
        };
    }
}