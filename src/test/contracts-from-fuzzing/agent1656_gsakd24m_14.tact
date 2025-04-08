struct StrangeOrder {
    b: Bool;
    s: String;
    i: Int as uint8;
    n: Int;
}

contract OutOfOrder {
    data: StrangeOrder;

    init() {
        self.data = StrangeOrder {
            n:10,
            b:true,
            i: 5,
            s: "weird order"
        };
    }
}