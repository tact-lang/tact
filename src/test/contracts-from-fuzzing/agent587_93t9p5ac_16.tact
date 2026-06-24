struct VariedOrder {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
}

contract VariedOrderContract {
    state: VariedOrder;

    init() {
        self.state = VariedOrder{
            a: 1,
            b: null,
            c: null,
            d: true
        };
    }
}