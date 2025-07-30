struct BoolStringMix {
    a: Bool;
    b: String;
    c: Bool?;
    d: String?;
}

contract BoolStringContract {
    rec: BoolStringMix;

    init() {
        self.rec = BoolStringMix{
            a:false,
            b:"hi",
            c:true,
            d:null
        };
    }
}