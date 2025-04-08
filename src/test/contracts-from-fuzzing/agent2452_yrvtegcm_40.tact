struct PairOpt {
    x: Int?;
    y: Int?;
}

contract DoubleOptionalStruct {
    pair: PairOpt = PairOpt{x:null,y:null};
    init() {
        self.pair = PairOpt{x:null,y:null};
    }
}