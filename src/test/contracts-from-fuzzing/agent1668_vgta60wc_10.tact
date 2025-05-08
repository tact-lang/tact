struct BoolMix {
    a: Bool;
    b: Bool?;
    c: Int;
    d: Bool;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    bm: BoolMix;
    init() {
        self.bm = BoolMix{
            a:true,b:null,c:42,d:false,e:null,f:true
        };
    }
}
