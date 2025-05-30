struct X {
    a: Int = 1;
}

struct Y {
    b: Int = 2;
}

struct Z {
    c: Int = 3;
}

contract Test20 {
    x: X;
    y: Y;
    z: Z;

    init() {
        self.x = X{};
        self.y = Y{};
        self.z = Z{};
    }
}
