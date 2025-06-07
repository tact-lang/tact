struct DifferentNumbers {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract DifferentSerializedInts {
    data: DifferentNumbers;
    init() {
        self.data = DifferentNumbers{
            a: 255,
            b: -12345,
            c: 123456789,
            d: -9876543210
        };
    }
}