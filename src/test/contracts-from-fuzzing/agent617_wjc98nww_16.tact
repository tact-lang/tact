struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct AB { a: A; b: B; }
struct BC { b: B; c: C; }

struct ABC {
    ab: AB;
    bc: BC;
}

contract OverlappingStructs {
    val: ABC;
    init() {
        self.val = ABC{
            ab: AB{ a: A{ x:1 }, b: B{ y:2 } },
            bc: BC{ b: B{ y:3 }, c: C{ z:4 } }
        };
    }
}
