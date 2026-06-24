struct ManyBooleans {
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
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: Bool;
}

contract TestContract {
    flags: ManyBooleans;

    init() {
        self.flags = ManyBooleans{
            a:true, b:false, c:true, d:false, e:true, f:false, g:true, h:false, i:true, j:false,
            k:true, l:false, m:true, n:false, o:true
        };
    }
}