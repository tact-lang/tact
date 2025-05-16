struct SOpt {
    opt: String?;
    num: Int;
    flag: Bool?;
}

contract MixedNullStart {
    s: SOpt;

    init() {
        self.s = SOpt{
            opt: null,
            num: 555,
            flag: null,
        };
    }
}