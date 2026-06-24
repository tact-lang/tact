struct WDefaults {
    i: Int = 5;
    b: Bool = true;
}

struct X {
    s: WDefaults;
}

struct Y {
    s: X;
}

contract TestChainDefaults {
    y: Y;

    init() {
        self.y = Y{ s: X{ s: WDefaults{} } };
    }
}
