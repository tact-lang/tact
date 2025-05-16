struct A {
    x: Int;
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

contract TestContract {
    persistent: D;

    init() {
        self.persistent = D{
            c: C{
                b: B{
                    a: A{ x: 99 }
                }
            }
        };
    }
}
