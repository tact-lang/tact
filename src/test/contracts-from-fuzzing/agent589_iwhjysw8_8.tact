struct OutOfOrder {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
}

contract OrderTest {
    st: OutOfOrder;

    init() {
        self.st = OutOfOrder{
            a: true,
            b: 1,
            c: false,
            d: 2,
            e: true,
        };
    }
}