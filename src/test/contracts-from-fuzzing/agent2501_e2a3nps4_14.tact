struct WithDefaults {
    f1: Int = 5;
    f2: Int = 10;
    f3: Bool = false;
    f4: String = "abc";
}

contract StructDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}