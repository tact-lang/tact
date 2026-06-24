struct FixedOrder {
    first: Int as uint4;
    second: Bool;
    third: String;
    fourth: Int as uint8;
}

contract FixedOrderTest {
    d: FixedOrder;

    init() {
        self.d = FixedOrder{
            first:6, second:true, third:"x", fourth:200
        };
    }
}