struct OptionalAndDefault {
    s: String?;
    i: Int = 123;
    b: Bool?;
    a: Address?;
}

contract OptDefaults {
    val: OptionalAndDefault;

    init() {
        self.val = OptionalAndDefault{
            s: null,
            i: 456,
            b: null,
            a: null
        };
    }
}