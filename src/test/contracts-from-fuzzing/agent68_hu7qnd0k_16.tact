struct InnerDepth {
    big1: Int as uint128;
    big2: Int as int120;
}

struct MidDepth {
    midVal: Int as int64;
    inner: InnerDepth;
}

struct OuterDepth {
    flag: Bool;
    mid: MidDepth;
}

contract DeepBigInts {
    state: OuterDepth;

    init() {
        self.state = OuterDepth{
            flag: true,
            mid: MidDepth{
                midVal: -123456789,
                inner: InnerDepth{
                    big1: 123456789012345678901234567890,
                    big2: -123456789012345678901234567
                }
            }
        };
    }
}
