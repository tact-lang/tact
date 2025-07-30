// test  very large struct
struct Huge {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: Int as uint32;
    j: Int as int64;
    k: Int as uint120;
    l: Int as int200;
    m: Int as coins;
}

contract BigContract {
    huge: Huge;

    init() {
        self.huge = Huge{
            a:1, b:true, c:"x", d:2, e:null, f:"y",
            g:255, h:-32000, i:4294967295, j:123456789, k:123456,
            l:-123456789, m:ton("99"),
        };
    }
}