struct StringVariants {
    empty: String;
    short: String;
    emoji: String;
    long: String;
}

contract StringInState {
    strs: StringVariants;

    init() {
        self.strs = StringVariants{
            empty: "",
            short: "abc",
            emoji: "🚀",
            long: "This is a long string stored in persistent contract state.",
        };
    }
}
