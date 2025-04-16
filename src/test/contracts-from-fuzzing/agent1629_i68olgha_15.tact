struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: String?;
}

contract DefaultsStruct {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            d: null,
            e: null,
        };
    }
}