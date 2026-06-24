struct WeirdSerialization {
    s1: Int as int1;
    s256: Int as int256;
    u1: Int as uint1;
    u256: Int as uint256;
}

contract TestContract {
    storage: WeirdSerialization;

    init() {
        self.storage = WeirdSerialization{
            s1: -1,
            s256: -1234,
            u1: 1,
            u256: 1234
        };
    }
}
