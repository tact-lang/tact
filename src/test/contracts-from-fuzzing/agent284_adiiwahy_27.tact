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
    val: Int;
}

contract VeryDeepNest {
    x: A;

    init() {
        self.x = A{
            b: B{
                c: C{
                    d: D{
                        e: E{ val: 42 }
                    }
                }
            }
        };
    }
}