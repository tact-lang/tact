struct WeirdOrder {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;
}

contract WeirdOrderTest {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            a: null,
            b: 1,
            c: null,
            d: true,
            e: null,
            f: "ok",
        };
    }
}