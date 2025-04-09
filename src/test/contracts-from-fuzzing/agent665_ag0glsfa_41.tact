struct CrazyMix {
    i: Int?;
    b: Bool?;
    s: String?;
    ni: Int;
    nb: Bool;
    ns: String;
}

contract ManyMixed {
    m1: CrazyMix = CrazyMix{i:null,b:null,s:null,ni:0,nb:true,ns:""};
    m2: CrazyMix = CrazyMix{i:1,b:true,s:"s",ni:10,nb:false,ns:"n"};

    init() {
        self.m1 = self.m1;
        self.m2 = self.m2;
    }

    receive() {
        let _ = self.m1;
        let _ = self.m2;
    }
}