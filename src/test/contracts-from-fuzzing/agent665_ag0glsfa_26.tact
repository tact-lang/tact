struct WithDefaults {
    a: Int = 3;
    b: Bool? = true;
    c: String = "yo";
}

contract AssignDefaults {
    d: WithDefaults = WithDefaults{};

    init() {
        self.d = self.d;
    }

    receive() {
        let _ = self.d;
    }
}