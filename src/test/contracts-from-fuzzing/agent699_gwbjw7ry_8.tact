struct TextStruct {
    s1: String = "A";
    s2: String = "B";
    s3: String = "A very large default string with many characters.................";
}

contract TextContract {
    textField: TextStruct;

    init() {
        self.textField = TextStruct{};
    }
}
