struct BoolHeavy {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract Test {
    flags: BoolHeavy;
    init() {
        self.flags = BoolHeavy{
            a:true, b:false, c:true, d:true,
            e:false, f:true, g:false, h:true
        };
    }
}