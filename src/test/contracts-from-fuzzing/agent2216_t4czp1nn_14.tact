struct Serializable {
    si8: Int as int8;
    ui8: Int as uint8;
    si16: Int as int16;
    ui16: Int as uint16;
    si32: Int as int32;
    ui32: Int as uint32;
    si64: Int as int64;
    ui64: Int as uint64;
}

contract SerializationSizes {
    data: Serializable;
    init() {
        self.data = Serializable{
            si8: -128,
            ui8: 255,
            si16: -32768,
            ui16: 65535,
            si32: -2147483648,
            ui32: 4294967295,
            si64: -9223372036854775808,
            ui64: 18446744073709551615
        };
    }
}
