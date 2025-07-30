struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Inner;
}

struct Inner {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Int?;
    ee: Bool?;
    ff: String?;
}

contract Combined {
    x: BigNested;
    init() {
        self.x = BigNested{
            a:1, b:true, c:"c", d:null, e:false, f:null,
            g: Inner{aa:10, bb:false, cc:"cc", dd:null, ee:null, ff:"f"}
        };
    }
}