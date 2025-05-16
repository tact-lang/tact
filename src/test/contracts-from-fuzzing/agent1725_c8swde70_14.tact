struct SerialMix {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int16;
    f: Int as uint16;
    g: Int as int32;
    h: Int as uint32;
    i: Int as int64;
    j: Int as uint64;
}

contract SerialMixTest {
    data: SerialMix;

    init() {
        self.data = SerialMix{
            a:1, b:1, c:2, d:2, e:3, f:3, g:4, h:4, i:5, j:5
        };
    }
}