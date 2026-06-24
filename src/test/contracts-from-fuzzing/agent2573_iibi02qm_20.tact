struct MixedSerialization {
    iVal: Int as int32;
    uVal: Int as uint32;
    price: Int as coins;
    active: Bool?;
    name: String?;
}

contract MixedSerStruct {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            iVal: -1234,
            uVal: 4321,
            price: ton("0.5"),
            active: null,
            name: null,
        };
    }
}