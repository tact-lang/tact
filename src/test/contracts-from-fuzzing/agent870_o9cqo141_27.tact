struct WeirdOrders {
    first: Int as int4;
    str: String;
    number: Int as uint256;
    flag: Bool;
    a2: Int as int4;
}

contract WeirdOrderTest {
    val: WeirdOrders;

    init() {
        self.val = WeirdOrders{ first: 1, str: "hi", number: 42, flag: true, a2: 2 };
    }
}