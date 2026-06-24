struct OptionalWithDefaults {
    a: Int?;
    b: Int = 100;
    c: Bool?;
}

contract TestContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{
            a: null,
            b: 42,
            c: true
        };
    }
}