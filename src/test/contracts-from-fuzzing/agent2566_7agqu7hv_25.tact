struct OptBoolStr {
    optBool: Bool?;
    optStr: String?;
}

contract OptionalMix {
    data: OptBoolStr;

    init() {
        self.data = OptBoolStr{optBool: null, optStr: null};
    }
}
