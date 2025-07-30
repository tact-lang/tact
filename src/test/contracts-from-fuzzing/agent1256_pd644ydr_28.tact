struct OptionWrap {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptStructRef {
    content: OptionWrap;

    init() {
        self.content = OptionWrap{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}
