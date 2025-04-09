struct Reordered {
    a: Int as uint4;
    b: Int as uint256;
    c: Int as uint32;
    d: Int;
}

contract SerializationOrder {
    data: Reordered;
    init() {
        self.data = Reordered{
            a: 3,
            b: 12345,
            c: 100,
            d: 42
        };
    }
}