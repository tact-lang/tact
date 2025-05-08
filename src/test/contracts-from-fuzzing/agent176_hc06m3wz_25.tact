struct X {
    x1: Int;
    x2: String;
}

struct Y {
    y1: Bool;
    y2: X;
}

struct Z {
    z1: Int;
    z2: Y;
    z3: String;
}

contract XYZNest {
    val: Z = Z{
        z1: 1,
        z2: Y{ y1:true, y2:X{ x1:2, x2:"foo" } },
        z3: "bar"
    };

    init() {
        self.val = Z{
            z1: 10,
            z2: Y{ y1:false, y2:X{ x1:20, x2:"baz" } },
            z3: "qux"
        };
    }
}