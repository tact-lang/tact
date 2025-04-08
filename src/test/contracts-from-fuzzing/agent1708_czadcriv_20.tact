struct OutOfOrder {
    c: Int;
    a: Int;
    e: Int;
    b: Int;
    d: Int;
}

contract TestContract {
    s: OutOfOrder;

    init() {
        self.s = OutOfOrder{
            c: 1,
            a: 2,
            e: 3,
            b: 4,
            d: 5
        };
    }
}