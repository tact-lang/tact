struct MultiLayerOpt {
    optInner: Int?;
    flag: Bool;
}

contract OptionalStructs {
    s1: MultiLayerOpt?;
    s2: MultiLayerOpt?;

    init() {
        self.s1 = null;
        self.s2 = MultiLayerOpt{
            optInner: 5,
            flag: false,
        };
    }
}
