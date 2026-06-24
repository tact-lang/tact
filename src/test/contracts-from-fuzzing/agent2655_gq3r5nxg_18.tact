contract OptionalSerialOrder {
    first: Int? as uint8;
    second: Int? as int16;
    third: Int? as uint32;
    fourth: Int? as int64;
    fifth: Int? as coins;

    init() {
        self.first = null;
        self.second = null;
        self.third = null;
        self.fourth = null;
        self.fifth = null;
    }
}