struct BoolOnly {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract TinyBits {
    bits: BoolOnly;

    init() {
        self.bits = BoolOnly{
            a:true,
            b:false,
            c:true,
            d:false,
            e:true
        };
    }
}