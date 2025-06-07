struct SerializedInts {
    ui8: Int as uint8;
    si8: Int as int8;
    ui64: Int as uint64;
    si64: Int as int64;
    coinsVal: Int as coins;
}

contract SerializedIntsState {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            ui8: 250,
            si8: -120,
            ui64: 123456789,
            si64: -123456789,
            coinsVal: ton("1"),
        };
    }
}
