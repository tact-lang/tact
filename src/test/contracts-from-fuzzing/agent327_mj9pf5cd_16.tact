struct InnerStr {
    s: String?;
    num: Int;
}

contract OptionalStringField {
    dat: InnerStr;

    init() {
        self.dat = InnerStr{ s: null, num: 42 };
    }
}
