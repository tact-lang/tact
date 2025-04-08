struct EmojiStruct {
    message: String = "Hello, 🌍! \u2600 \u{1F680}";
}

contract TestContract {
    info: EmojiStruct;

    init() {
        self.info = EmojiStruct{
            message: "Custom: 🚀✨"
        };
    }
}