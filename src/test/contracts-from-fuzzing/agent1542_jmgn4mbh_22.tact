struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract Test {
    optStruct: ManyOpts;

    init() {
        self.optStruct = ManyOpts{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}