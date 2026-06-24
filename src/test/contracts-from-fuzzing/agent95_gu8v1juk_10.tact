struct Info {
    score: Int;
    active: Bool?;
}

contract ContractMix {
    value: Int;
    title: String?;
    optFlag: Bool?;
    nestedOpt: Info?;

    init() {
        self.value = 7;
        self.title = "abc";
        self.optFlag = null;
        self.nestedOpt = Info{ score: 99, active: null };
    }
}