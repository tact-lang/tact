struct WeirdOrder {
    c: Int;
    a: Bool;
    b: String;
    e: Cell;
    d: Address;
}

contract TestContract {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            c: 5,
            a: true,
            b: "str",
            e: emptyCell(),
            d: myAddress()
        };
    }
}