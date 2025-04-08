struct MixedOpt {
    i: Int?;
    s: String?;
    b: Bool?;
    c: Cell?;
    sl: Slice?;
}

contract FancyContract {
    data: MixedOpt?;
    init() {
        self.data = MixedOpt{ i:null, s:"string", b:null, c:null, sl:null };
    }
}