struct SerOrdering {
    a: Int as uint8;
    b: Bool;
    c: Int as uint4;
    d: Int as int16;
}

contract SerializationOrdering {
    ordered: SerOrdering;

    init() {
        self.ordered = SerOrdering{
            a: 10,
            b: true,
            c: 4,
            d: -123
        };
    }
}