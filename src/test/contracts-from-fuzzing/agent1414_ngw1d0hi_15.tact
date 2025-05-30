struct MixFieldOrder {
    a: Bool;
    b: Int;
    c: String;
    d: Bool;
    e: Int;
}

contract MixedOrderTest {
    s: MixFieldOrder;

    init() {
        self.s = MixFieldOrder{
            a: true,
            b: 10,
            c: "abc",
            d: false,
            e: 20
        };
    }
}