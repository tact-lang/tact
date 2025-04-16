struct Wide {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Int as uint4;
    h: Int as int64;
    i: Int as coins;
}

contract TestContract {
    w: Wide = Wide{
        a:1, b:true, c:null, d:null, e:"hi", f:null, g:5, h:10, i:20
    };

    init() {
        self.w = Wide{
            a:1, b:true, c:null, d:null, e:"hi", f:null, g:5, h:10, i:20
        };
    }

    receive() {
        dump(self.w.g);
    }
}