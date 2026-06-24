struct Wrap {
    val: Int;
}

contract TwoWraps {
    f1: Wrap;
    f2: Wrap;

    init() {
        self.f1 = Wrap{ val: 1 };
        self.f2 = Wrap{ val: 2 };
    }
}