struct OutOfOrder {
    a: Int as uint8;
    b: Int;
    c: Int as uint32;
    d: Int;
}

contract OutOfOrderContract {
    f: OutOfOrder;
    init() {
        self.f = OutOfOrder{ a:1, b:2, c:3, d:4 };
    }
}