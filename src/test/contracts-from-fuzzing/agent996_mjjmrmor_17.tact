struct SerializedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int4;
    d: Int;
}

contract TestStorage {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            a: 5,
            b: -300,
            c: 7,
            d: 1000,
        };
    }
}