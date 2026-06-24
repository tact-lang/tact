struct OptionDefault {
    txt: String? = null;
}

contract StructOptWithDefault {
    s: OptionDefault;

    init() {
        self.s = OptionDefault{ txt: "x" };
    }
}