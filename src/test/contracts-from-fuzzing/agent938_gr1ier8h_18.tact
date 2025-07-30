struct OptsAndDefaults {
    a: Int = 10;
    b: Bool?;
    c: String = "hi";
    d: Int?;
}

contract DefaultsAndNulls {
    f: OptsAndDefaults;

    init() {
        self.f = OptsAndDefaults{
            a: 20,
            b: null,
            c: "hello",
            d: null,
        };
    }
}
