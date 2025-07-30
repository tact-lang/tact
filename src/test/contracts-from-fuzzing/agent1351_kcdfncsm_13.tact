struct SerialInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
}

contract SerialContract {
    serials: SerialInts;

    init() {
        self.serials = SerialInts{
            a:10, b:500, c:1_000_000, d:10_000_000_000, e:10_000_000_000_000
        };
    }
}