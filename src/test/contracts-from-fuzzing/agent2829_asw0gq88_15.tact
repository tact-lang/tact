struct SerializedFields {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
}

contract AnnotatedFieldsStorage {
    sf: SerializedFields;

    init() {
        self.sf = SerializedFields{
            a: 255,
            b: -32000,
            c: 1_000_000,
            d: -1234567890,
            e: 1234567890123456789,
        };
    }
}
