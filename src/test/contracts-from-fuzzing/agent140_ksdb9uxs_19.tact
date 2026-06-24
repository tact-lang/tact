struct OptionalText {
    name: String?;
    nickname: String?;
}

contract DoubleOptionalStrings {
    texts: OptionalText;

    init() {
        self.texts = OptionalText{
            name: null,
            nickname: null,
        };
    }
}