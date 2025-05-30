struct Wrapper {
    val: Int;
}

contract TestContract {
    w1: Wrapper;
    w2: Wrapper;
    w3: Wrapper;

    init() {
        self.w1 = Wrapper{ val: 1 };
        self.w2 = Wrapper{ val: 2 };
        self.w3 = Wrapper{ val: 3 };
    }
}