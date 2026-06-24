struct OptionalString {
    s: String?;
}

contract OptStringField {
    prop: OptionalString;

    init() {
        self.prop = OptionalString{ s: null };
    }

    receive() {
        let s = self.prop;
    }
}