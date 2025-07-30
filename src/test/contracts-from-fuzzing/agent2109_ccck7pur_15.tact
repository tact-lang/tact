struct A {
    x: Int;
}
struct B {
    x: Int;
    a: A;
}
struct C {
    x: Int;
    b: B;
}
struct D {
    x: Int;
    c: C;
}

contract ManyNesting {
    d: D;

    init() {
        self.d = D{
            x: 1,
            c: C{
                x: 2,
                b: B{
                    x: 3,
                    a: A{ x: 4 }
                }
            }
        };
    }
}