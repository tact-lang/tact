struct PrimOptMix {
    a: Int?;
    b: String;
    c: Bool?;
    d: String?;
}

contract PrimOptMixTest {
    s: PrimOptMix;
    init() {
        self.s = PrimOptMix{
            a:null,
            b:"test",
            c:null,
            d:null,
        };
    }
}