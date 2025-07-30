struct OptionInStruct {
    f: Int?;
}

contract TopLevelOptStruct {
    s: OptionInStruct?;

    init() {
        self.s = null;
    }
}