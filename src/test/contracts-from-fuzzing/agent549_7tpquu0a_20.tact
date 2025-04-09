struct WeirdOrder {
    b: Bool;
    x: Int;
    s: String;
    y: Int;
    f: Bool;
    str: String;
}

contract WeirdOrderTest {
    value: WeirdOrder;

    init() {
        self.value = WeirdOrder{
            x: 42,
            b: true,
            f: false,
            s: "aaa",
            y: 100,
            str: "bbb",
        };
    }
}