struct OutOfOrder {
    a: Int as uint8;
    b: Bool;
    c: Int;
    d: String;
}

contract OutOrderContr {
    val: OutOfOrder;

    init() {
        self.val = OutOfOrder{
            a: 255,
            b: false,
            c: 999,
            d: "qqq",
        };
    }
}