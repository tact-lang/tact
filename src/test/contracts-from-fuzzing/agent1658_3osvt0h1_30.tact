struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct BigContainer {
    a: A;
    b: B;
    c: C;
}

contract NestedManySmall {
    val: BigContainer;

    init() {
        self.val = BigContainer{
            a: A{ x:1 },
            b: B{ y:2 },
            c: C{ z:3 }
        };
    }
}