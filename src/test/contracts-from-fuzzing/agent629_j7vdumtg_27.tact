struct MixStruct {
    a: Int;
    b: String;
    c: Bool?;
}

contract ManyMix {
    s1: MixStruct;
    s2: MixStruct;
    s3: MixStruct;

    init() {
        self.s1 = MixStruct{ a:1, b:"a", c:null };
        self.s2 = MixStruct{ a:2, b:"b", c:true };
        self.s3 = MixStruct{ a:3, b:"c", c:false };
    }
}