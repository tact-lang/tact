struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hello";
}

contract UseDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }

    receive() {
        self.val = WithDefaults{ a: 99, b: true, c: "bye" };
    }
}