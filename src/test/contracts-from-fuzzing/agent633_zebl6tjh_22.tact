struct SerializeStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
}

contract SerialStructHolder {
    ser: SerializeStruct;

    init() {
        self.ser = SerializeStruct {
            a: 255,
            b: -32768,
            c: 18446744073709551615
        };
    }
}