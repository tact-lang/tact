struct OptionCombine {
    flag: Bool?;
    content: String;
}

contract OptNonOptMix {
    data: OptionCombine;

    init() {
        self.data = OptionCombine{
            flag:null,
            content: "test",
        };
    }
}