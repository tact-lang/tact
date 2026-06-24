struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

struct All {
    sa: A;
    sb: B;
    sc: C;
    opt: A?;
}

contract TestContract {
    all: All;
    init() {
        self.all = All{
            sa: A{ x: 1 },
            sb: B{ y: true },
            sc: C{ z:"q" },
            opt: null
        };
    }
}