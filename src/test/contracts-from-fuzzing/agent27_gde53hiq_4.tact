struct SerializedInts {
    a: Int as int64;
    b: Int as uint32;
    c: Int as uint8;
}

contract TestContract {
    ints: SerializedInts;

    init() {
        self.ints = SerializedInts{a: 123, b: 456, c: 7};
    }
}