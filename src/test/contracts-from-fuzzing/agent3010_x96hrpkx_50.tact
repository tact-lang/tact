struct BigMix {
    i1: Int;
    s1: String;
    o1: Int?;
    b1: Bool;
    o2: String?;
    i2: Int;
    s2: String;
    o3: Int?;
    b2: Bool;
    o4: String?;
}

contract LotsOfMix {
    val: BigMix;

    init() {
        self.val = BigMix{
          i1:1,s1:"a",o1:null,b1:true,o2:null,i2:2,s2:"b",o3:null,b2:false,o4:null
        };
    }
}
