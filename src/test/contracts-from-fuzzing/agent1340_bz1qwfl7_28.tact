struct DeepSerialize {
    s1: Int as uint8;
    s2: Int as uint16;
    s3: Int as uint32;
    s4: Int as uint64;
    s5: Int as uint128;
}

contract NestedSerialize {
    deep: DeepSerialize;

    init() {
        self.deep = DeepSerialize{
            s1: 1,
            s2: 2,
            s3: 3,
            s4: 4,
            s5: 5,
        };
    }
}