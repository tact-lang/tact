struct IntSerializations {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
}

contract SerialTest {
    nums: IntSerializations;

    init() {
        self.nums = IntSerializations{
            a: 7,
            b: -8,
            c: 4294967295,
        };
    }
}