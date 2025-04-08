struct SerializationFormats {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint16;
}

contract TestContract {
    val: SerializationFormats;

    init() {
        self.val = SerializationFormats{
            a: 255,
            b: -12345,
            c: 65535
        };
    }
}