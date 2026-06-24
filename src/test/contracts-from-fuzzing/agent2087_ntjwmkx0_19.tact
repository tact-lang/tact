struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Layered {
    a: A;
    b: B;
    c: C;
}

contract MultiStructTypes {
    data: Layered;

    init() {
        self.data = Layered{
            a: A{x:1},
            b: B{y:2},
            c: C{z:3}
        };
    }
}