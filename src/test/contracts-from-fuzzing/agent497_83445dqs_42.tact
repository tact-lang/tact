struct MixFieldSerde {
    a: Int as int64;
    b: Bool;
    c: String;
    d: Int? as uint8;
    e: Bool?;
    f: String?;
}

contract FullMixSerde {
    f: MixFieldSerde;

    init() {
        self.f = MixFieldSerde{
            a:1234,b:true,c:"hey",d:null,e:false,f:"opt" 
        };
    }
}