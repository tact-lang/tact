struct ManyOpts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract Opts {
    f: ManyOpts;
    init() {
        self.f = ManyOpts{
            a:null,b:null,c:true,d:null,e:"abc",f:false
        };
    }
}