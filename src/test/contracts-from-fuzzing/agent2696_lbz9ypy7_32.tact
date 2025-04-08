struct Inner {
    x: Int = 7;
}

contract InitPartial {
    s: Inner;
    init() {
        self.s = Inner{};
    }
}