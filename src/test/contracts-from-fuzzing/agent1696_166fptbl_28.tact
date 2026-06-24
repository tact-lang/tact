struct InnerInts {
    small: Int as uint8;
    big: Int as uint256;
}

struct OuterInts {
    mid: Int as uint64;
    inn: InnerInts;
}

contract SerializationNestTest {
    data: OuterInts;

    init() {
        self.data = OuterInts{
            mid: 12345678,
            inn: InnerInts{ small: 200, big: 1 << 200 }
        };
    }
}