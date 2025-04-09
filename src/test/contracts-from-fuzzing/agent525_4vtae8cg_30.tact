struct UnusualOrder {
    s: String;
    n: Int as uint16;
    b: Bool;
    opt1: Bool?;
    opt2: Int?;
    opt3: String?;
}

contract VariedOrder {
    rec: UnusualOrder;

    init() {
        self.rec = UnusualOrder{
            s: "hey",
            n: 42,
            b: false,
            opt1: true,
            opt2: null,
            opt3: null,
        };
    }
}