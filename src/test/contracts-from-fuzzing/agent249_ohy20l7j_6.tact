struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { z: Int; b: B; }
struct D { q: Int; c: C; }
struct E { w: Int; d: D; }

contract ChainNestTest {
    e: E;

    init() {
        self.e = E {
            w: 5,
            d: D {
                q: 4,
                c: C {
                    z: 3,
                    b: B {
                        y: 2,
                        a: A { x:1 }
                    }
                }
            }
        };
    }
}
