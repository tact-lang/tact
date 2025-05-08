struct NestedInts {
    small: Int as uint4;
    mid: Int as int16;
    large: Int as uint64;
}

contract SerializeMixTest {
    ni: NestedInts;

    init() {
        self.ni = NestedInts{
            small: 7,
            mid: -200,
            large: 123456789
        };
    }

    receive() {}
}