struct BoolMix {
    a: Bool;
    b: Bool;
    c: Bool?;
    d: Bool?;
}

contract BoolMixC {
    prop: BoolMix;

    init() {
        self.prop = BoolMix{
            a:true,
            b:false,
            c:null,
            d:true
        };
    }
}
