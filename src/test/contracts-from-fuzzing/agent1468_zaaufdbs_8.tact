struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
    d: Int?; // implicit default null
}

contract TestDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            d: null,
        };
    }
}