struct OptionalAndDefaults {
    i: Int?;
    b: Bool? = false;
    s: String? = "x";
}

contract Combo {
    val: OptionalAndDefaults;

    init() {
        self.val = OptionalAndDefaults {
            i: null
        };
    }
}