struct SerStruct {
    intFull: Int;
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
}

contract TestSerStruct {
    s: SerStruct;

    init() {
        self.s = SerStruct{
            intFull: 1,
            int8: 2,
            uint8: 3,
            int16: 4,
            uint16: 5
        };
    }
}
