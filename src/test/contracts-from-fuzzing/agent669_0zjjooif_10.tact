struct HasNullableString {
    text: String?;
}

contract NullableStringHolder {
    s: HasNullableString;

    init() {
        self.s = HasNullableString{ text: null };
    }
}