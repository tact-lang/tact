struct EightBit {
    x: Int as uint8;
    y: Int as uint8;
}

contract TestAssignOutOfRange {
    a: EightBit;

    init() {
        self.a = EightBit{x: 42, y: 300};
    }
}