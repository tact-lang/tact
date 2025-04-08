struct LargeNestedInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
    f: Int as uint256;
}

struct ContainingLarge {
    inner: LargeNestedInts;
    flag: Bool;
}

contract NestedIntHolder {
    wrapped: ContainingLarge;

    init() {
        self.wrapped = ContainingLarge{
            inner: LargeNestedInts{
                a:1, b:2, c:3, d:4, e:5, f:6
            },
            flag: true
        };
    }
}