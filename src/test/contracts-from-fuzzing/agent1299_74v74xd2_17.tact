struct IntsSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract IntsSerializationHolder {
    state: IntsSerialization;

    init() {
        self.state = IntsSerialization{
            a: 255,
            b: -32768,
            c: 4294967295,
            d: -9223372036854775808,
        };
    }
}
