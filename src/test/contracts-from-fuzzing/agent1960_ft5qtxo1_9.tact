struct SerialFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
}

contract SerializedFieldsTest {
    val: SerialFormats;

    init() {
        self.val = SerialFormats{
            a: 5,
            b: -20,
            c: 99999,
            d: -1,
        };
    }
}