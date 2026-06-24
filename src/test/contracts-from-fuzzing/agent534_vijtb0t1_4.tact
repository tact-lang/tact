struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract Defaulted {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{};
    }
}