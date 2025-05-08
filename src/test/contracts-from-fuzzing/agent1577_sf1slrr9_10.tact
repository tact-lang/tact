struct DeepOptional {
    innerOpt: Int?;
    txt: String;
    flag: Bool;
}

contract OptionNested {
    f: DeepOptional?;

    init() {
        self.f = null;
    }
}
