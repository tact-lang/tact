struct S {
    a: Int;
    b: Int?;
    c: Int as int64;
    d: Int?;
    e: Bool;
    f: Bool?;
}

contract TestContract {
    sfield: S;
    init() {
        self.sfield = S{ a:1, b:null, c:64, d:null, e:false, f:true };
    }
}