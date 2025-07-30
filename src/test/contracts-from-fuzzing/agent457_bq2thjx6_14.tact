struct WeirdOrder {
    c: String;
    a: Int;
    b: Bool;
    d: Cell;
}

contract Test {
    data: WeirdOrder;
    init() {
        self.data = WeirdOrder{
            a: 7,
            b: true,
            c: "order",
            d: emptyCell()
        };
    }
}