struct WideStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
}

contract HasWide {
    s: WideStruct = WideStruct{
        a:1, b:"a", c:true, d:2, e:"b", f:false, g:3, h:"c", i:true, j:4, k:"d"
    };

    init() {
        self.s = WideStruct{
            a:10, b:"aa", c:false, d:20, e:"bb", f:true, g:30, h:"cc", i:false, j:40, k:"dd"
        };
    }
}