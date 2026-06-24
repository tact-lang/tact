struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultedStructField {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}