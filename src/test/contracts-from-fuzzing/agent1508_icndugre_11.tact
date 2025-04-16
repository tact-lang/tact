struct IntField {
    bigInt: Int as int257;
    smallInt: Int as uint4;
}

contract IntSerializations {
    ints: IntField;

    init() {
        self.ints = IntField{
            bigInt: -1234,
            smallInt: 9,
        };
    }
}
