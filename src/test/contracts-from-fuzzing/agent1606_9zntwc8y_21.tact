struct WithDefaults {
    a: Int = 42;
    b: String = "hi";
    c: Bool = false;
    d: Int? = null;
    e: String? = null;
}

contract StructWithDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }

    receive() {
        let v = self.val;
    }
}