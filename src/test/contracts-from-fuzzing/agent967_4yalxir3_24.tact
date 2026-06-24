struct OptionStringStruct {
    value: String?;
}

contract OptStringPersist {
    s: OptionStringStruct;

    init() {
        self.s = OptionStringStruct{value: null};
    }
}