struct BigOne {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint8;
    d: Int as int16;
    e: Int as int16;
    f: Int as int16;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: String;
    l: String;
    m: String;
    n: Int = 42;
    o: Int = -1;
    p: Bool = true;
    q: Bool = false;
    r: String = "foo";
    s: String = "bar";
    t: String = "baz";
}

contract BigStore {
    data: BigOne;

    init() {
        self.data = BigOne {
            a:1, b:2, c:3, d:4, e:5, f:6,
            g:true, h:false, i:true, j:false,
            k:"k", l:"l", m:"m",
            n:100, o:-100, p:false, q:true,
            r:"r", s:"s", t:"t"
        };
    }
}