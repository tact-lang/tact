struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
}

contract StructDefaultFields {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{ };
    }
}
