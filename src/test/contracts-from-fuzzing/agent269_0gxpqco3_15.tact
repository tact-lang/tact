struct OptionalStruct {
    text: String? = null;
    flag: Bool? = null;
}

contract OptionalDefaults {
    opt: OptionalStruct? = null;

    init() {
        self.opt = OptionalStruct{ text: "x", flag: true };
    }
}