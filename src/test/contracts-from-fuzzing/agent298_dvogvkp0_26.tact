struct OptionMix {
    a:Int?;
    b:Bool?;
    c:String?;
    d:Slice?;
    e:Cell?;
    f:Address?;
}

contract OptMixFields {
    data: OptionMix;
    init() {
        self.data = OptionMix{ a:null, b:null, c:null, d:null, e:null, f:null };
    }
}