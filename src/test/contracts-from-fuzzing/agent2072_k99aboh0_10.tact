struct SerializationHints {
    a: Int as int64;
    b: Int as uint8;
    flag: Bool;
}

contract SerializedStruct {
    data: SerializationHints;

    init() {
        self.data = SerializationHints{
            a: -42,
            b: 255,
            flag: true,
        };
    }
}