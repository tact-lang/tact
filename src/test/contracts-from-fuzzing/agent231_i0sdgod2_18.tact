struct MultiSerialize {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint256;
}

contract SerializeLayers {
    s: MultiSerialize;

    init() {
        self.s = MultiSerialize{
            a:1, b:2, c:3, d:4
        };
    }
}