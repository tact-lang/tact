struct DifferentSerializations {
    s8: Int as int8;
    u16: Int as uint16;
    s64: Int as int64;
}

contract SerializationChecks {
    data: DifferentSerializations;

    init() {
        self.data = DifferentSerializations{
            s8: -100,
            u16: 255,
            s64: -100000
        };
    }
}
