struct Inner {
    a: Int = 1;
    b: Bool = true;
}

contract HasStruct {
    s: Inner;

    init() {
        self.s = Inner{};
    }
}