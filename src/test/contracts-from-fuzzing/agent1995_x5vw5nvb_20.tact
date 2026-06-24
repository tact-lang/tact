struct SerialOrder {
    a: Int as uint4;
    b: Int;
    c: Int as int64;
    d: Bool;
    e: String;
}

contract SerialOrderTest {
    data: SerialOrder;
    init() {
        self.data = SerialOrder{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: "q"
        };
    }
}