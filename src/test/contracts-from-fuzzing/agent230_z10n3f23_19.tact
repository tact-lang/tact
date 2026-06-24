struct OptionalString {
    s: String?;
}

contract OptStringStruct {
    strOpt: OptionalString;

    init() {
        self.strOpt = OptionalString {
            s: null
        };
    }
}
