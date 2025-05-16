struct OutOfOrder {
    a: Int as int64;
    b: Int;
    c: Int as uint8;
}

contract OutOfOrderContract {
    store: OutOfOrder;

    init() {
        self.store = OutOfOrder{
            a: 100,
            b: 200,
            c: 5,
        };
    }
}
