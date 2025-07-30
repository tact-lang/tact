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

contract ManyNested {
    myField: D;
    init() {
        self.myField = D{
            w: C{
                z: B{
                    y: A{
                        x: 77
                    }
                }
            }
        };
    }
}