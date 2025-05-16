struct BoolOnly {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

contract BoolArray {
    bits: BoolOnly;

    init() {
        self.bits = BoolOnly{
            a:true, b:false, c:true, d:false, e:true,
            f:false, g:true, h:false, i:true, j:false
        };
    }
}