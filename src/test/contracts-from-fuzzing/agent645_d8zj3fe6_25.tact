struct TextAndOpt {
    text: String;
    maybeNum: Int?;
}

contract EmbedOptional {
    val: TextAndOpt;

    init() {
        self.val = TextAndOpt{
            text: "abcdef",
            maybeNum: null
        };
    }
}
