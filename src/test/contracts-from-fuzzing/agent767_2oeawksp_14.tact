struct NestedOptionalString {
    str1: String?;
    str2: String;
}

contract NestedOptStrings {
    store: NestedOptionalString;

    init() {
        self.store = NestedOptionalString{
            str1: null,
            str2: "abc"
        };
    }
}