struct SerializeMix2 {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
}

contract ContractSerializeFormats {
    data: SerializeMix2;
    init() {
        self.data = SerializeMix2{
            a: -128,
            b: 255,
            c: -32768,
            d: 65535
        };
    }
}