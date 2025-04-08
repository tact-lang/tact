struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

struct Container {
    a: A;
    b: B;
    c: C;
}

contract MultiInnerStructs {
    v: Container;
    init() {
        self.v = Container{
            a: A{ x: 1 },
            b: B{ y: 2 },
            c: C{ z: 3 }
        };
    }
}