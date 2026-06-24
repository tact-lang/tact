struct ManyBools {
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

contract BoolsPacked {
    m: ManyBools;
    init() {
        self.m = ManyBools{
            a:true, b:false, c:true, d:false, e:true,
            f:false, g:true, h:true, i:false, j:true
        };
    }
}