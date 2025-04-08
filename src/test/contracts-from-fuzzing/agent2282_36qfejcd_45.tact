struct ZeroInt {
    i: Int = 0;
}

contract Test41 {
    s: ZeroInt;

    init() {
        self.s = ZeroInt{};
    }
}