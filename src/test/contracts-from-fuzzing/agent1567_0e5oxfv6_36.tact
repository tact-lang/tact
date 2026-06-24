struct IntsVariousSize {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int256;
}

contract IntSizes {
    ints: IntsVariousSize;

    init() {
        self.ints = IntsVariousSize{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}