struct BoolOnly {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract CompactBoolStorage {
    flags: BoolOnly;

    init() {
        self.flags = BoolOnly{
            a:true, b:false, c:true, d:false, e:true
        };
    }
}