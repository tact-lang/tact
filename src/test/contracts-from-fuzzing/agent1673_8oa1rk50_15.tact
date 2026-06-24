struct VariedOrder {
    b: Bool;
    s: String;
    i: Int;
    bs: Bool?;
    ss: String?;
    ii: Int?;
}

contract VariedOrderTest {
    val: VariedOrder;

    init() {
        self.val = VariedOrder{
            b: true,
            s: "abc",
            i: 42,
            bs: null,
            ss: null,
            ii: null,
        };
    }
}