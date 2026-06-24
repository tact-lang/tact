struct Packed {
    small: Int as uint8;
    medium: Int as int16;
    large: Int as uint64;
}

contract TestContract {
    optPacked: Packed? = null;

    init() {
        self.optPacked = Packed{ small: 10, medium: 20, large: 30 };
    }
    receive() {}
}
