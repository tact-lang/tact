struct LotsOfOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: Address?;
    h: String?;
    i: Bool?;
    j: Int?;
}

contract NullOpts {
    data: LotsOfOpt;
    init() {
        self.data = LotsOfOpt{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}