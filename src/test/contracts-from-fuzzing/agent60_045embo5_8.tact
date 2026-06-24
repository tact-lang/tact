struct Packed {
    small: Int as uint8;
    medium: Int as int16;
    large: Int as uint64;
}

contract TestContract {
    packedData: Packed = Packed{ small: 1, medium: -2, large: 3 };

    init() {
        self.packedData = Packed{ small: 10, medium: 20, large: 30 };
    }
    receive() {}
}
