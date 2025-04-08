struct Alternating {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int;
    b2: Bool;
    s2: String;
    opti: Int?;
    optb: Bool?;
    opts: String?;
}

contract AlternatingFields {
    data: Alternating;

    init() {
        self.data = Alternating{
            i1:1, b1:true, s1:"a",
            i2:2, b2:false, s2:"b",
            opti:null, optb:null, opts:null
        };
    }
}