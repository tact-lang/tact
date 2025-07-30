struct BigMix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyMixFields {
    val: BigMix;

    init() {
        self.val = BigMix{
            a:1,b:true,c:"c",d:null,e:null,f:null
        };
    }
}