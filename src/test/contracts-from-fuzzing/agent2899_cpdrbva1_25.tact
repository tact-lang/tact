struct OptionalStr {
    s: String?;
}

contract OptStringField {
    opt: OptionalStr;

    init() {
        self.opt = OptionalStr{ s: null };
    }
}
