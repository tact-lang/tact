struct SerializeTrick {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint1;
    d: Int as int1;
}

contract TestStructSerialize {
    val: SerializeTrick;

    init() {
        self.val = SerializeTrick{
            a: 255,
            b: -128,
            c: 1,
            d: -1
        };
    }
}