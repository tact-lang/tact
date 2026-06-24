struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
}

contract LotsOfOptionalFields {
    opts: ManyOptional;

    init() {
        self.opts = ManyOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}
