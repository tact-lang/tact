struct OptionalStr {
    s: String?;
}

contract HasOptString {
    strct: OptionalStr;
    init() {
        self.strct = OptionalStr{s: null};
    }
}