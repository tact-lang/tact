struct SWithOptionalString {
    text: String?;
}

contract StrOptField {
    s: SWithOptionalString;

    init() {
        self.s = SWithOptionalString{ text: "hello" };
    }
}