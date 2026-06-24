struct X {
    a: Int?;
}

struct Y {
    x: X;
}

struct Z {
    y: Y;
}

contract OptionalInsideChain {
    state: Z;
    init() {
        self.state = Z{ y: Y{ x: X{ a: null } } };
    }
}