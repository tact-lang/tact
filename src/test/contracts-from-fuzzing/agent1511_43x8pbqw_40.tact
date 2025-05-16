struct OptionalString {
    msg: String?;
}

contract OptionalStringInside {
    val: OptionalString;
    init() {
        self.val = OptionalString{ msg: null };
    }
}