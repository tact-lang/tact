struct LongText {
    a: String = "ThisIsADefaultStringLongerThan20Chars";
    b: String? = "AnotherQuiteLongDefaultText";
}

contract TextDefaults {
    val: LongText = LongText{};

    init() {
        self.val = LongText{
            a: "short",
            b: null,
        };
    }
}