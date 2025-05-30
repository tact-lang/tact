struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Int?; // defaults to null
}

contract Test {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}