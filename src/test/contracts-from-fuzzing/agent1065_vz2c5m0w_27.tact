struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "str";
    o: Int?;
}

contract DefaultsThenSet {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}
