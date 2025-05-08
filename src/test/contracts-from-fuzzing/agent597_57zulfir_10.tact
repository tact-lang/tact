struct StrangeOrder {
    b: String;
    a: Int;
    d: Bool;
    c: Int?;
}

contract OutOfOrder {
    record: StrangeOrder;
    init() {
        self.record = StrangeOrder{
            a: 5,
            b: "hello",
            c: null,
            d: true
        };
    }
}