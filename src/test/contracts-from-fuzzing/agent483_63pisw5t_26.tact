struct ManyPrim {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
}

struct ManyOpt {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
}

contract PrimAndOpt {
    m: ManyPrim;
    o: ManyOpt;

    init() {
        self.m = ManyPrim{
            i:1,b:true,s:"x",a:myAddress()
        };
        self.o = ManyOpt{
            oi:null, ob:null, os:null, oa:null
        };
    }
}
