struct EmojiStruct {
    smile: String;
    hand: String;
}

contract EmojiFields {
    data: EmojiStruct;

    init() {
        self.data = EmojiStruct{ smile: "😊", hand: "🤚" };
    }
}