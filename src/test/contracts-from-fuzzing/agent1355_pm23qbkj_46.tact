struct WeirdOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
}
contract OrderTest {
    f: WeirdOrder;
    init() {
        self.f = WeirdOrder{
            a: 1,
            b: null,
            c: "x",
            d: null,
            e: true
        };
    }
}