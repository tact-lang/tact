struct SerializedIntegers {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint1;
    d: Int as int4;
}

contract SerializedIntsContract {
    si: SerializedIntegers;

    init() {
        self.si = SerializedIntegers{
            a: 42,
            b: -123,
            c: 1,
            d: -3,
        };
    }
}