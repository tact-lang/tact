struct X {
    a: Int;
}

struct Y {
    b: Int;
}

contract TupleStyle {
    x: X;
    y: Y;
    init() {
        self.x = X{ a: 32 };
        self.y = Y{ b: 11 };
    }
}