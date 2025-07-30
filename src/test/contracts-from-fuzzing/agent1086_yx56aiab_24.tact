struct OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptDefContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{
            a: null,
            b: null,
            c: null
        };
    }
}