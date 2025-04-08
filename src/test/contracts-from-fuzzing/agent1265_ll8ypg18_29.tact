// Wide struct with different types and many optionals interleaved
struct Wide {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
    g: Int;
    h: String?;
    i: Bool;
    j: Int?;
}

contract WideMix {
    storage: Wide;
    init() {
        self.storage = Wide{
            a:1, b:null, c:false, d:2, e:"foo", f:true, g:3, h:null, i:true, j:null
        };
    }
}