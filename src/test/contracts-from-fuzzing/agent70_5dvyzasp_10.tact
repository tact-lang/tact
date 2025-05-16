struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
}

contract Test {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{ d: null };
    }
}