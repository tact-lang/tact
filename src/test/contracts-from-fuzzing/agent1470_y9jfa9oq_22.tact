struct BigMix {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool?;
    i: String;
}

contract MultiMixTest {
    m: BigMix;

    init() {
        self.m = BigMix{
            a:1,b:true,c:null,d:5,e:false,f:"f",g:null,h:true,i:"end"
        };
    }
}