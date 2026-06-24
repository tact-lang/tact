struct ManyPrims {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract NestedPrimMix {
    payload: ManyPrims;
    init() {
        self.payload = ManyPrims{
            a:1,b:true,c:"a",d:null,e:false,f:null,g:99,h:true,i:"b"
        };
    }
}