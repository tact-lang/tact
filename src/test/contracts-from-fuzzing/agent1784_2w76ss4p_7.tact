struct IntSerializations {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int4;
    d: Int as int8;
    e: Int as coins;
}

contract SerializedInts {
    val: IntSerializations;

    init() {
        self.val = IntSerializations{
            a: 4, b: 8, c: -3, d: -7, e: ton("1")
        };
    }
}