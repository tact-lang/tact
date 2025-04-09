struct StrangeOrder {
    b: Int;
    a: Int;
    d: Bool;
    c: Bool;
}

contract WeirdOrder {
    data: StrangeOrder;
    init() {
        self.data = StrangeOrder{
            b: 1,
            a: 2,
            d: true,
            c: false
        };
    }
}