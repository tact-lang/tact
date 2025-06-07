contract FieldSerializations {
    int8Field: Int as int8 = -8;
    uint8Field: Int as uint8 = 8;
    int64Field: Int as int64 = -64;
    uint64Field: Int as uint64 = 64;
    coinField: Int as coins = 1000;

    init() {}
}