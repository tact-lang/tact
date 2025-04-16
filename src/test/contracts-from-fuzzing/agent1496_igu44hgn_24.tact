struct Wrapper {
    num: Int?;
}

contract C {
    w1: Wrapper?;
    w2: Wrapper?;
    w3: Wrapper?;
    init() {
        self.w1 = null;
        self.w2 = null;
        self.w3 = null;
    }
}