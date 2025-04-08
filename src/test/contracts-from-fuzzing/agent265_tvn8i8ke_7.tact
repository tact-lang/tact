struct OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{
            a: null,
            b: true,
            c: null,
        };
    }
}