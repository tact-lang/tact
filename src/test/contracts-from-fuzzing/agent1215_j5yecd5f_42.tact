struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract DefaultsAndNulls {
    param: WithDefaults;

    init() {
        self.param = WithDefaults {
            c: null,
            d: null
        };
    }
}