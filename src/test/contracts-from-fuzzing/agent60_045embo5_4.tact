struct Inner {
    flag: Bool;
}

struct Middle {
    innerOpt: Inner?;
}

contract TestContract {
    data: Middle = Middle{ innerOpt: null };

    init() {
        self.data = Middle{ innerOpt: Inner{ flag: true } };
    }
    receive() {}
}
