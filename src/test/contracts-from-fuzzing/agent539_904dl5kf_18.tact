struct AltOrder {
    s: String;
    b: Bool;
    i: Int;
    c: Cell;
    a: Address;
}

contract TestContract {
    alt: AltOrder;
    init() {
        self.alt = AltOrder{
            s: "order",
            b: false,
            i: 100,
            c: emptyCell(),
            a: myAddress(),
        };
    }
}