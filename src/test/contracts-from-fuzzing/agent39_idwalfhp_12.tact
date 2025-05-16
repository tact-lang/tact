struct TextWrap {
    message: String;
    author: String;
}

contract WithStrings {
    content: TextWrap;

    init() {
        self.content = TextWrap{
            message: "sample",
            author: "tester",
        };
    }
}