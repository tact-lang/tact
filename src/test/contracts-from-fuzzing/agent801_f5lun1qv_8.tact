struct OptsAndDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract OptDefaultsContract {
    storage: OptsAndDefaults;

    init() {
        self.storage = OptsAndDefaults{
            b: 42,
            d: true
        };
    }
}