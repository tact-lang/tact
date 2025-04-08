struct Inner {
    val1: Int;
    val2: Bool;
}

contract DefaultVals {
    s1: Inner = Inner{ val1: 42, val2: false };
    n: Int = 100;

    init() {
        self.n = 200;
    }
}
