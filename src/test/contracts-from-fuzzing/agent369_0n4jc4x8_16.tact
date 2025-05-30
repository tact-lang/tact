struct OptionalIntSizes {
    a: Int? as int8;
    b: Int? as int16;
    c: Int? as int32;
    d: Int? as int64;
    e: Int? as int128;
    f: Int?;
}

contract OptionalIntSizesTest {
    s: OptionalIntSizes;

    init() {
        self.s = OptionalIntSizes{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null,
        };
    }
}