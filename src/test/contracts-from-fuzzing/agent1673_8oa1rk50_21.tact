struct TextWrap {
    text: String;
}

contract OptionalTextWrap {
    wrap: TextWrap?;

    init() {
        self.wrap = null;
    }
}