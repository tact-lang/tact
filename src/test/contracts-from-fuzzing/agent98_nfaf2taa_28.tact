struct BoolOptionMix {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
}

contract BoolOptionMixContract {
    data: BoolOptionMix;

    init() {
        self.data = BoolOptionMix{
            a:true, b:null, c:false, d:true, e:true, f:null
        };
    }
}