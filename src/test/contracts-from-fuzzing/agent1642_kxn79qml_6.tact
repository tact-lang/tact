struct ManyOptionalDefaults {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptionals {
    data: ManyOptionalDefaults;

    init() {
        self.data = ManyOptionalDefaults{};
    }
}