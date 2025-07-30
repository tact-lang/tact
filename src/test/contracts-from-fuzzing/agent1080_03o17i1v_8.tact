struct Ints {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as uint256;
}

contract IntsContract {
    data: Ints;

    init() {
        self.data = Ints{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}