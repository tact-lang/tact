struct OptionalMix {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
    f: Cell?;
}

contract OptMixTest {
    mix: OptionalMix = OptionalMix{
        a:null, b:null, c:null, d:null, e:null, f:null
    };

    init() {
        self.mix = OptionalMix{
            a:1, b:2, c:true, d:"str", e:myAddress(), f:emptyCell()
        };
    }
}