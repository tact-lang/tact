struct ZeroInt {
    z: Int = 0;
}

contract TestZeroInt {
    val: ZeroInt;
    init() {
        self.val = ZeroInt{};
    }
}