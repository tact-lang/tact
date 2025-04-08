struct StrangeOrder {
    c: String;
    a: Int;
    d: Bool;
    b: Int;
}

contract WeirdOrder {
    rec: StrangeOrder;

    init() {
        self.rec = StrangeOrder{
            c: "zzz",
            a: 1,
            d: true,
            b: 2,
        };
    }
}