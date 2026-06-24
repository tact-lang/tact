struct WeirdOrder {
    b: Bool;
    s: String;
    a: Int;
}

contract TestWeirdOrder {
    w: WeirdOrder;

    init() {
        self.w = WeirdOrder{
            b: true,
            s: "xyz",
            a: 42
        };
    }
}