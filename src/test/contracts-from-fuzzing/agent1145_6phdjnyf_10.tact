struct DifferentIntegerSerializations {
    tiny: Int as uint4;
    small: Int as int8;
    medium: Int as uint64;
    large: Int as int256;
    defaultInt: Int;
}

contract IntSerializationTest {
    data: DifferentIntegerSerializations;

    init() {
        self.data = DifferentIntegerSerializations{
            tiny: 7,
            small: -5,
            medium: 123456789,
            large: -123456789012345678901234567890,
            defaultInt: 42
        };
    }
}
