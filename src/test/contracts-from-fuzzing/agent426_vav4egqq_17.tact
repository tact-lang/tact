struct Wrapper {
    inner: Int?;
}

contract TestContract {
    w1: Wrapper;
    w2: Wrapper;
    w3: Wrapper;

    init() {
        self.w1 = Wrapper{ inner: null };
        self.w2 = Wrapper{ inner: 42 };
        self.w3 = Wrapper{ inner: null };
    }
}