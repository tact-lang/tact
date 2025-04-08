struct IntWithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint1;
}

contract SerializedInts {
    data: IntWithSerialization;

    init() {
        self.data = IntWithSerialization{
            a: 1000,
            b: -123456789,
            c: 1
        };
    }
}