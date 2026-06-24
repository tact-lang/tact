struct TextStruct {
    greeting: String = "Hello";
    emoji: String = "🚀";
    empty: String = "";
}

contract StringDefaults {
    s: TextStruct = TextStruct{};

    init() {
        self.s = TextStruct {
            greeting: "Hi",
            emoji: "🌕",
            empty: ""
        };
    }

    receive() {}
}