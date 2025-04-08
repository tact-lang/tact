struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
}

contract ContractDefaultValues {
    example: WithDefaults;

    init() {
        self.example = WithDefaults{};
    }
}
