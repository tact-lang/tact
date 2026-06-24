struct OptionWrap {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
}

contract OptionalFields {
    options: OptionWrap;

    init() {
        self.options = OptionWrap{
            optInt: null,
            optBool: null,
            optCell: null,
        };
    }
}