struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract LongStructContract {
    s: LongStruct;
    init() {
        self.s = LongStruct{
            a:1, b:true, c:"a", d:2, e:"b", f:false, g:3, h:"c", i:true, j:4
        };
    }
}