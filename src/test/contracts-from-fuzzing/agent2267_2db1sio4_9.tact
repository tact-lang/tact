struct StrWrap {
    s: String;
}

contract OptionalStringDeep {
    optA: String?;
    strWrap: StrWrap;
    optWrap: StrWrap?;

    init() {
        self.optA = null;
        self.strWrap = StrWrap{s:"test"};
        self.optWrap = null;
    }
}
