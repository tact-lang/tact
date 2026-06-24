struct SerialOrder {
    a: Int as uint8;
    b: Int as uint4;
    c: Int as coins;
    d: Int as int16;
}

contract TestContract {
    data: SerialOrder;

    init() {
        self.data = SerialOrder{ a:1, b:2, c:ton("1"), d:4 };
    }
}