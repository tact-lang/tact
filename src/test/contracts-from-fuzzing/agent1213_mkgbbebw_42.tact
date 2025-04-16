struct OptionString {
    s: String?;
}

contract OptionStringField {
    val: OptionString;

    init() {
        self.val = OptionString { s: null };
    }
}