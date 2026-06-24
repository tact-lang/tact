struct EmojiHolder {
    smiley: String;
}

contract EmojiPersist {
    data: EmojiHolder;

    init() {
        self.data = EmojiHolder{
            smiley: "Hello 🌍🚀!"
        };
    }
}
