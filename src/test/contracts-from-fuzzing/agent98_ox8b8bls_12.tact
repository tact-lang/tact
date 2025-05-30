struct WeirdOrder {
    a: Int;
    b: String;
    c: Int?;
    d: Bool;
    e: String?;
    f: Bool?;
}

contract FieldOrderTest {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder{
            a: 1,
            b: "hi",
            c: null,
            d: false,
            e: null,
            f: null
        };
    }
}