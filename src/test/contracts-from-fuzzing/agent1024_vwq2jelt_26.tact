struct OptionalMix {
    i: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptionalMixContract {
    field: OptionalMix;

    init() {
        self.field = OptionalMix{
            i:null, b:null, s:null, addr:null, c:null, sl:null
        };
    }
}