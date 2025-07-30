struct OptionalString {
    text: String?;
}

contract OptStringField {
    val: OptionalString;

    init() {
        self.val = OptionalString{
            text: null,
        };
    }

    receive() {
        let v = self.val;
    }
}