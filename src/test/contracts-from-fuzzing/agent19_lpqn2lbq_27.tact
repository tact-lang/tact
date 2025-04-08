struct X {
    x1: Int?;
    x2: Int?;
}

struct Y {
    y1: X;
}

contract TestContract {
    y: Y;

    init() {
        self.y = Y{ y1: X{ x1: null, x2: 10 } };
    }
}