struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct MultiNest {
 a: A;
 b: B;
 c: C;
}

contract MixNested {
    store: MultiNest;
    init() {
        self.store = MultiNest{
            a: A{ x: 1},
            b: B{ y: 2},
            c: C{ z: 3}
        };
    }
}