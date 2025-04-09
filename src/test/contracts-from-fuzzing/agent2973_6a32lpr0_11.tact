struct SerializeWidths {
    s8: Int as int8;
    u8: Int as uint8;
    s128: Int as int128;
    u128: Int as uint128;
    defaultInt: Int;
}

contract SerWidthsTest {
    ser: SerializeWidths;

    init() {
        self.ser = SerializeWidths{
            s8: -100,
            u8: 250,
            s128: -123456789,
            u128: 123456789,
            defaultInt: 42
        };
    }
}