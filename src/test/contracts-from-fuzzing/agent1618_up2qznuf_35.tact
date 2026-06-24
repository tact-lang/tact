struct Emojistr {
    txt: String = "Unicode emoji: 😃 and escapes: \" \\ \n";
}

contract EmojiEscape {
    data: Emojistr;

    init() {
        self.data = Emojistr{};
    }
}