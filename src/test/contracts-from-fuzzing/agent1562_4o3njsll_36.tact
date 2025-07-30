struct Z {
    z: Int;
}

struct Y {
    y: Z;
}

struct X {
    x: Y;
}

contract ChainDefaults {
    s: X;

    init() {
        self.s = X{ x: Y{ y: Z{ z: 5 } } };
    }
}
