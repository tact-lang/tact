struct OutOfOrder {
    f1: Int as int4;
    f2: Int as uint7;
    f3: Int as int1;
    f4: Int;
}

contract Test31 {
    x: OutOfOrder;

    init() {
        self.x = OutOfOrder{
            f1: 5,
            f2: 10,
            f3: 1,
            f4: 123456,
        };
    }
}
