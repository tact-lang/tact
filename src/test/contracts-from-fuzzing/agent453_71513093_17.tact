struct OptionalMix {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract TestContract {
    m: OptionalMix;
    init() {
        self.m = OptionalMix {
            i:null,
            b:null,
            s:null,
            a:null,
            c:null,
            sl:null
        };
    }
}