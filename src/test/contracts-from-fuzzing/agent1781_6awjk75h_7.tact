struct SBig {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: String;
}

contract BigStructInState {
    s: SBig;

    init() {
        self.s = SBig{
            a:1, b:2, c:3, d:4, e:5,
            f:true, g:false, h:true,
            i:"a", j:"b", k:"c"
        };
    }
}