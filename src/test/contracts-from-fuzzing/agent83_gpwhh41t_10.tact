struct Sizer {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint1;
    e: Int as int257;
}

contract SerializedSizes {
    val: Sizer;
    init() {
        self.val = Sizer{
            a: 0,
            b: 1,
            c: -1,
            d: 1,
            e: 123456789
        };
    }
}
