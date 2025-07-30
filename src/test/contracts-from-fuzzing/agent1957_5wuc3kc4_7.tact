struct OptionCombo {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
}

contract OptionalMix {
    state: OptionCombo;

    init() {
        self.state = OptionCombo{a:null,b:null,c:null,d:null,e:null};
    }
}