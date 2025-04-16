struct SerializedFields {
    amount: Int as coins;
    smallInt: Int as int16;
    bigUint: Int as uint128;
    optCoins: Int? as coins;
    optUint: Int? as uint32;
}

contract SerializedStruct {
    ser: SerializedFields;

    init() {
        self.ser = SerializedFields{
            amount: 1000000,
            smallInt: -1234,
            bigUint: 12345678901234567890,
            optCoins: null,
            optUint: null
        };
    }
}