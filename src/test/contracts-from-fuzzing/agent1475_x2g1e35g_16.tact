struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    a: A;
    b: B;
}

struct D {
    c: C;
}

struct E {
    d: D;
}

contract ManyLayers {
    val: E;

    init() {
        self.val = E{
            d: D{
                c: C{
                    a: A{x: 1},
                    b: B{y: 2},
                }
            }
        };
    }
}