struct SerialOrder {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Int;
}

contract SerializationContract {
    storage: SerialOrder;

    init() {
        self.storage = SerialOrder{
            a: 5,
            b: 42,
            c: 100,
            d: 1234
        };
    }
}