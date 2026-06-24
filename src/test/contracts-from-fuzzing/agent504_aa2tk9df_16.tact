struct WeirdOrder {
    s1: String;
    b1: Bool;
    i1: Int;
    s2: String;
    b2: Bool;
    i2: Int;
}

contract WeirdOrderTest {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder{
            s1: "a", b1: true, i1: 1,
            s2: "b", b2: false, i2: 2
        };
    }
}