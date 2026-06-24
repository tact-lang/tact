struct OptionalWithNonNullDefault {
    a: Int? = 7;
}

contract Test {
    val: OptionalWithNonNullDefault;

    init() {
        self.val = OptionalWithNonNullDefault{ a: null };
    }
}