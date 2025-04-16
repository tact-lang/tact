struct Emoj {
    val: String;
}

contract EmojiString {
    data: Emoj;

    init() {
        self.data = Emoj{ val: "🚀" };
    }
}