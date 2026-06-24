// Test serialization formats in fields without explicit init
contract SerializeFormats {
    small: Int as uint8;
    neg: Int as int16;
    big: Int as coins;

    init() {
        self.small = 1;
        self.neg = -10;
        self.big = ton("1");
    }
}