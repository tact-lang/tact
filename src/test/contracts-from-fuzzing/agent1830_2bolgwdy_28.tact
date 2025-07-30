struct WeirdOrder {
    a: Int as uint8;
    b: String;
    c: Bool;
    d: Cell;
    e: Int?;
}

contract TestContract {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            a: 42,
            b: "str",
            c: true,
            d: emptyCell(),
            e: null
        };
    }
}
