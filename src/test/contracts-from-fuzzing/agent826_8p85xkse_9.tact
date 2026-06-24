struct Inner {
    score: Int;
}

struct Middle {
    innerOpt: Inner?;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    state: Outer = Outer{ middle: Middle{ innerOpt: null } };

    init() {
        self.state = Outer{ middle: Middle{ innerOpt: Inner{ score: 100 } } };
    }
}
