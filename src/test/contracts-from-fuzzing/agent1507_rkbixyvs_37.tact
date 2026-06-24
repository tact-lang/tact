struct MixSer {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint128;
    d: Int;
    e: Int as uint256;
}

contract MixSerializeFields {
    f: MixSer;

    init() {
        self.f = MixSer{
            a:1, b:2, c:3, d:4, e:5
        };
    }
}
