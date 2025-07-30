struct OptionalAndDefaults {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Int = 123;
}

contract OptDefContract {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{
            a: null,
            c: null
        };
    }
}