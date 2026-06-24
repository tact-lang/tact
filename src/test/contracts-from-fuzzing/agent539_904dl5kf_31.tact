struct WeirdOrder {
    c: Cell;
    b: Bool;
    i: Int;
    s: String;
    adr: Address;
}

contract TestContract {
    w: WeirdOrder;
    init() {
        self.w = WeirdOrder{
            c: emptyCell(),
            b: false,
            i: 77,
            s: "order",
            adr: myAddress(),
        };
    }
}