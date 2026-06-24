struct A {
    x: Int;
    y: Bool;
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

struct E {
    d: D;
}

contract Test {
    field: E;
    init() {
        self.field = E{
            d: D{
                c: C{
                    b: B{
                        a: A{ x:1, y:true }
                    }
                }
            }
        };
    }
}