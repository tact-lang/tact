struct BoolOnly {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract BitPackTest {
    data: BoolOnly;

    init() {
        self.data = BoolOnly{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true
        };
    }
}