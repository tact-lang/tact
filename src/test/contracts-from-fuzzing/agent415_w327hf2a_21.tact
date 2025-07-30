struct WeirdOrder {
    maybe: Int?;
    sure: Int;
}

contract WeirdOrderTest {
    s: WeirdOrder;

    init() {
        self.s = WeirdOrder{ maybe: null, sure: 123 };
    }
}