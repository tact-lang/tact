struct UnusualOrder {
    b: String;
    a: Int;
    c: Bool;
    d: Int?;
    e: String?;
}

contract OrderTester {
    rec: UnusualOrder;

    init() {
        self.rec = UnusualOrder{
            b: "hi",
            a: 9,
            c: true,
            d: null,
            e: null
        };
    }
}