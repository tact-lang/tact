struct SerializeFormats {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
    d: Bool;
    e: Address;
}

contract SerializationStruct {
    val: SerializeFormats;

    init() {
        self.val = SerializeFormats{
            a: 1000,
            b: -5000,
            c: 255,
            d: true,
            e: myAddress()
        };
    }
}
