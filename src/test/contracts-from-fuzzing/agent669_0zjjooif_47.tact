struct SerialCombo {
    i8: Int as uint8;
    i64: Int as int64;
    coin: Int as coins;
}

contract SerializedFields {
    val: SerialCombo;

    init() {
        self.val = SerialCombo{
            i8: 255,
            i64: 12345,
            coin: ton("1")
        };
    }
}