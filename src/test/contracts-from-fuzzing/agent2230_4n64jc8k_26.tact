// test struct with mixed optional and non-optional primitive fields
struct MixOpt {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedOptContract {
    m: MixOpt;
    init() {
        self.m = MixOpt{ a:1, b:null, c:true, d:false, e:"X", f:null };
    }
}