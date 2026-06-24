struct OptionalStrings {
    s1: String?;
    s2: Address?;
}

contract OptionalFields {
    val: OptionalStrings = OptionalStrings{ s1: null, s2: null };

    init() {
        self.val = OptionalStrings{ s1: "hi", s2: myAddress() };
    }
}