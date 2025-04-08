struct IntSerializations {
    i_default: Int;
    i8: Int as int8;
    u64: Int as uint64;
}

contract SerialContract {
    data: IntSerializations;

    init() {
        self.data = IntSerializations{
            i_default: 123,
            i8: -12,
            u64: 1000
        };
    }
}