struct HasNullableString {
    s: String?;
}

contract NullableStringField {
    data: HasNullableString;
    init() {
        self.data = HasNullableString{ s: null };
    }
}