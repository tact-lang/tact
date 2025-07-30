struct WeirdOrder {
    c: String;
    a: Int;
    b: Bool;
}

contract WeirdOrderContract {
    data: WeirdOrder;
    init() {
        self.data = WeirdOrder{
            c: "hi",
            a: 5,
            b: true,
        };
    }
}