struct SerializeEdge {
    a: Int as int1;    // -1..0
    b: Int as int4;    // -8..7
    c: Int as int8;    // -128..127
    d: Int as int16;   // -32768..32767
    e: Int as int64;   // large
    f: Int as int256;  // huge
    g: Int as uint1;   // 0..1
    h: Int as uint4;   // 0..15
    i: Int as uint8;   // 0..255
    j: Int as uint16;  // 0..65535
    k: Int as uint64;  // large
    l: Int as uint256; // huge
}

contract Test {
    data: SerializeEdge;
    init() {
        self.data = SerializeEdge{
            a:0,
            b:7,
            c:127,
            d:32767,
            e:99999999,
            f:999999999999999999,
            g:1,
            h:15,
            i:255,
            j:65535,
            k:1234567890,
            l:999999999999999999,
        };
    }
}