struct StrangeOrder {
    c: String;
    a: Int;
    b: Bool;
}

contract OutOfOrder {
    data: StrangeOrder;

    init() {
        self.data = StrangeOrder{
            c: "x",
            a: 1,
            b: false,
        };
    }
}