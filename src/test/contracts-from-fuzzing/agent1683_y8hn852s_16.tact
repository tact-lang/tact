struct HasString {
    text: String;
}

contract LargeStringField {
    val: HasString;

    init() {
        self.val = HasString{ text: "a very large string with emojis 🚀🔥✨🎉 end" };
    }

    receive() {
        self.val = HasString{ text: "another big string 🧬💎🌟 end" };
    }
}