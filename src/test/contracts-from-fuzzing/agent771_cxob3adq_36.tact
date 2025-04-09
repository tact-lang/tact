struct ManyOpts {
    a: Int?; b: Int?; c: Int?;
    d: String?; e: String?;
    f: Bool?; g: Bool?;
}
contract AllOptionalState {
    opts: ManyOpts = ManyOpts{
        a:null, b:null, c:null, d:null, e:null, f:null, g:null
    };

    init() {
        self.opts = ManyOpts{
            a:1,b:2,c:3,d:"x",e:"y",f:true,g:false
        };
    }
}
