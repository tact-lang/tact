struct OptionalWithNestedDefaults {
    s: String = "hi";
    b: Bool?;
    i: Int? = null;
}

contract TestOptDefaults {
    val: OptionalWithNestedDefaults;

    init() {
        self.val = OptionalWithNestedDefaults{
            b: true,
        };
    }
}