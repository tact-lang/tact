struct SerializationFormats {
    i8: Int as int8;
    ui8: Int as uint8;
    i16: Int as int16;
    ui16: Int as uint16;
    i32: Int as int32;
    ui32: Int as uint32;
    coins: Int as coins;
}

contract FormatsMix {
    formats: SerializationFormats;

    init() {
        self.formats = SerializationFormats{
            i8: -5,
            ui8: 250,
            i16: -1234,
            ui16: 5555,
            i32: -55555,
            ui32: 555555,
            coins: ton("0.1")
        };
    }
}