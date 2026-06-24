struct OutOfOrder {
    b: Int;
    a: Int;
    d: Bool;
    c: Bool;
}

contract OutOfOrderTest {
    data: OutOfOrder;

    init() {
        self.data = OutOfOrder{
            b: 1,
            a: 2,
            d: true,
            c: false
        };
    }
}
