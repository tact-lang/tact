struct MultiOpt {
    ai: Int?;
    ab: Bool?;
    astr: String?;
    ac: Cell?;
    aslc: Slice?;
    aaddr: Address?;
}

contract OptCombo {
    v: MultiOpt;
    init() {
        self.v = MultiOpt{
            ai:null, ab:null, astr:null, ac:null, aslc:null, aaddr:null
        };
    }
}
