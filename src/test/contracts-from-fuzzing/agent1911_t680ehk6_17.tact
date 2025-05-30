struct TextWrap {
    message: String;
    note: String;
    info: String;
}

contract TextContract {
    text: TextWrap;

    init() {
        self.text = TextWrap{
            message: "hi",
            note: "there",
            info: "buddy"
        };
    }
}