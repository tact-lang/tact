struct SerialOrder {
    first: Int as uint4;
    second: Int as uint8;
    third: Int as int16;
    fourth: Int as coins;
}

contract SerializedOrderFields {
    f: SerialOrder;

    init() {
        self.f = SerialOrder{
            first: 1, second:2, third:3, fourth: ton("1")
        };
    }
}