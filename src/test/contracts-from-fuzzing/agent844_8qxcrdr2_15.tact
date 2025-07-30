struct StructWithSerial {
    i32: Int as int32;
    u4: Int as uint4;
    big: Int;
    optStr: String?;
}

contract SerialFormats {
    testField: StructWithSerial;

    init() {
        self.testField = StructWithSerial{
            i32: -123,
            u4: 7,
            big: 100,
            optStr: null,
        };
    }

    receive() {
        let _ = self.testField;
    }
}
