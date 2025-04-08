struct WeirdOrder {
    last: Int;
    mid: String;
    first: Bool;
}

contract OrderTest {
    s: WeirdOrder;

    init() {
        self.s = WeirdOrder{
            last: 3,
            mid: "middle",
            first: true
        };
    }
}
