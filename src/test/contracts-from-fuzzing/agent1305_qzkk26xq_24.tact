struct A { x: Int; }
struct B { y: Int; }

struct ATuple {
    left: A;
    right: A;
}

struct BTuple {
    left: B;
    right: B;
}

contract MultiStructTest {
    aa: ATuple;
    bb: BTuple;

    init() {
        self.aa = ATuple{
            left: A{ x: 1 },
            right: A{ x: 2 },
        };
        self.bb = BTuple{
            left: B{ y: 10 },
            right: B{ y: 20 },
        };
    }
}