struct OneBit {
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

contract TestContract {
    bits: OneBit;

    init() {
        self.bits = OneBit{
            a:true, b:false, c:true, d:false, e:true,
            f:true, g:true, h:true, i:false, j:true
        };
    }
}
