struct Overlap {
    a: Int as uint8;
    b: Int as int8;
}

contract OverlappingSerializations {
    val: Overlap;

    init() {
        self.val = Overlap{ a: 127, b: 127 };
    }
}