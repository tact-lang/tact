struct OrderingCheck {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as coins;
    e: Slice as remaining;
}

contract OrderingCheckStore {
    val: OrderingCheck;

    init() {
        self.val = OrderingCheck{
            a:1, b:2, c:3, d:4, e:emptyCell().asSlice()
        };
    }
}