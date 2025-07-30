struct X {
    val: Int;
}

contract MultiXHolder {
    x1: X;
    x2: X;

    init() {
        self.x1 = X{ val: 1 };
        self.x2 = X{ val: 2 };
    }
}
