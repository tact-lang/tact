struct X {
    a: Int = 1;
    b: Int = 2;
}

struct Y {
    c: Int = 3;
}

struct Z {
    x: X = X{};
    y: Y = Y{};
}

contract DefaultedNested {
    s: Z = Z{};
    init() {
        self.s = Z{};
    }
}
