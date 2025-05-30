struct InnerMix {
    a:Int as uint8;
    b:Bool?;
    c:String;
}

struct TopMix {
    i: Int;
    im: InnerMix;
    s:String?;
}

contract MixTypesDeep {
    val: TopMix;

    init() {
        self.val = TopMix{
            i: 1,
            im: InnerMix{ a:5, b:null, c: "inner" },
            s: null
        };
    }
}