struct OptDefaults {
    a: Int?;
    b: Bool?;
    c: String? = "hello";
    d: Int?;
}

contract OptDefaultsPersist {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{
            a: null,
            b: null,
            d: null,
        };
    }
}