struct StrangeOrder {
    b: Bool;
    a: Int;
    s: String;
}

contract OutOfOrderFields {
    data: StrangeOrder;

    init() {
        self.data = StrangeOrder{b:false,a:42,s:"hi"};
    }
}
