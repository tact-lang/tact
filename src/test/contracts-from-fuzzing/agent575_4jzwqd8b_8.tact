struct Wrap {
    value: Int;
}

contract TestContract {
    w1: Wrap;
    w2: Wrap;
    w3: Wrap;

    init() {
        self.w1 = Wrap{ value: 1 };
        self.w2 = Wrap{ value: 2 };
        self.w3 = Wrap{ value: 3 };
    }
}
