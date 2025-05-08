struct OptionalString {
    s: String?;
    n: Int;
}

contract OptionalStr {
    val: OptionalString;

    init() {
        self.val = OptionalString{
            s: null,
            n: 42
        };
    }
}
