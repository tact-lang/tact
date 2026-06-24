// Field order serialization impact test
struct OrderTest {
    first: Int as uint4;    // 4 bits
    second: Bool;          // 1 bit
    third: Int as uint4;   // 4 bits
    fourth: Bool;          // 1 bit
    last: Int = 999;
}

contract FieldOrder {
    snapshot: OrderTest;

    init() {
        self.snapshot = OrderTest{
            first: 1,
            second: true,
            third: 2,
            fourth: false,
            last: 1000,
        };
    }
}
