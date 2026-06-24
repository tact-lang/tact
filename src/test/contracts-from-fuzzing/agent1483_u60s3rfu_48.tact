struct SerialStruct {
    int8F: Int as int8;
    uint8F: Int as uint8;
    boolF: Bool;
}

contract SerialStructWrap {
    data: SerialStruct;

    init() {
        self.data = SerialStruct{
            int8F: -7,
            uint8F: 7,
            boolF: true,
        };
    }
}