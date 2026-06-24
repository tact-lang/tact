struct StrangeOrder {
    a: Int as uint4;
    b: Int;
    c: Int as uint64;
    d: Int as int8;
}

contract MixedSerialization {
    val: StrangeOrder;

    init() {
        self.val = StrangeOrder{
            a: 3,
            b: 1000,
            c: 42,
            d: -7
        };
    }
}