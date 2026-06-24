struct Tiny1 { x: Int }
struct Tiny2 { y: Int }
struct Tiny3 { z: Int }

struct Middle {
    m1: Tiny1;
    m2: Tiny2;
    m3: Tiny3;
}

contract NestedManySmall {
    m: Middle;

    init() {
        self.m = Middle{
            m1: Tiny1{ x: 1 },
            m2: Tiny2{ y: 2 },
            m3: Tiny3{ z: 3 }
        };
    }
}