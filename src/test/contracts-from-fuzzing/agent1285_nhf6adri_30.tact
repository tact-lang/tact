struct Inner {
    a: Int = 1;
    b: Int? = null;
}

contract TestContract {
    s1: Inner;
    s2: Inner;
    init() {
        self.s1 = Inner{};
        self.s2 = Inner{};
    }
}