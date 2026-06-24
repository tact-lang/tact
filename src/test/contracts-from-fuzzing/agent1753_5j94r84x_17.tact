struct OptionalString {
    msg: String?;
}

contract OptionContract {
    os: OptionalString;
    init() {
        self.os = OptionalString{ msg: null };
    }
}
