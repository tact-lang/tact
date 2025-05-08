struct ManyBool {
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

contract LotsOfBool {
    bits: ManyBool;

    init() {
        self.bits = ManyBool{
            a:true, b:false, c:true, d:false, e:true,
            f:false, g:true, h:false, i:true, j:false
        };
    }
}