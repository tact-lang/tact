struct MixedSizes {
    a: Int as int2;
    b: Int as int4;
    c: Int as int8;
    d: Int as int16;
    e: Int as int32;
    f: Int as int64;
    g: Int as int128;
    h: Int as int256;
}

contract MixedSizesPersist {
    val: MixedSizes;

    init() {
        self.val = MixedSizes{
            a: 1,b: 2,c: 3,d: 4,e: 5,f: 6,g: 7,h: 8
        };
    }
}
