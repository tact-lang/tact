struct Serz {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint256;
    d: Int?;
    e: Int = 5;
}

contract TestContract {
    state: Serz;

    init() {
        self.state = Serz{
            a: 100,
            b: 10,
            c: 999,
            d: null,
            e: 123
        };
    }
}