// assign large negative to int as int8 (range -128..127)
contract LargeNegToInt8 {
    a: Int as int8;

    init() {
        self.a = -9999;
    }
}
