struct SDefaultMix {
    a: Int=1;
    b: String="b";
    c: Bool=true;
    d: Int?=null;
    e: String?=null;
}

contract DefaultMix {
    s: SDefaultMix;

    init() {
        self.s = SDefaultMix{
            a:1,b:"b",c:true,d:null,e:null
        };
    }
}