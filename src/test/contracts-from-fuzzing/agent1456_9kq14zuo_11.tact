struct OptionalDefaultsStruct {
    num: Int? = null;
    str: String? = null;
    flag: Bool? = null;
}

contract OptionalDefaultsContract {
    s: OptionalDefaultsStruct;

    init() {
        self.s = OptionalDefaultsStruct{};
    }
}
