struct Serializations {
    ui8: Int as uint8;
    si64: Int as int64;
    coin: Int as coins;
    fl: Bool;
}

contract MixedSerializations {
    ss: Serializations;

    init() {
        self.ss = Serializations{
            ui8:1,
            si64:-5,
            coin:ton("1"),
            fl:true,
        };
    }
}
