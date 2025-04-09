struct LongRecord {
    a: Int;
    b: Int as uint1;
    c: Int as int8;
    d: Int as uint4;
    e: Int as int64;
    f: Int as uint32;
    g: Int;
    h: Int as uint8;
    i: Int as int257;
    j: Int as uint256;
    k: Int as uint16;
    l: Int as uint128;
    m: Int as int32;
    n: Int as uint64;
    o: Int as int16;
}

contract PackedInts {
    record: LongRecord;

    init() {
        self.record = LongRecord{
            a: 1, b:1, c:1, d:1, e:1, f:1, g:1, h:1, i:1, j:1, k:1, l:1, m:1, n:1, o:1,
        };
    }
}