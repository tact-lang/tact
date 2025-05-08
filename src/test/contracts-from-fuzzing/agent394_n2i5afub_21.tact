struct Tiny {
    a: Int as uint2 = 1;
    b: Int as uint3 = 2;
    c: Int as uint5 = 3;
}
struct Middle {
    t1: Tiny;
    t2: Tiny;
}
contract TestContract {
    m1: Middle;
    m2: Middle;

    init() {
        self.m1 = Middle{
            t1: Tiny{ a:1, b:2, c:3 },
            t2: Tiny{ a:4, b:5, c:6 }
        };
        self.m2 = Middle{
            t1: Tiny{ a:7, b:1, c:2 },
            t2: Tiny{ a:3, b:4, c:5 }
        };
    }
}