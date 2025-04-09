struct LongStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: String;
    g: Bool;
    h: Int;
    i: String;
    j: Bool;
    k: Int;
    l: Int;
}

contract LongTest {
    s: LongStruct;
    init() {
        self.s = LongStruct{
            a:0, b:1, c:2, d:3, e:true, f:"hi", g:false, h:4, i:"ok", j:true, k:5, l:6
        };
    }
}