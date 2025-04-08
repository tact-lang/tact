struct OptionString { s: String? }

contract OptionalStringField {
    val: OptionString;

    init() {
        self.val = OptionString{ s: null };
    }
}