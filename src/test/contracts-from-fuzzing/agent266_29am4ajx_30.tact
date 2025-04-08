struct SerialSizes {
    int128: Int as int128;
    uint16: Int as uint16;
    int4: Int as int4;
    uint8: Int as uint8;
}

contract SerialSizesContract {
    data: SerialSizes;

    init() {
        self.data = SerialSizes{
            int128: 1,
            uint16: 2,
            int4: 3,
            uint8: 4
        };
    }
}