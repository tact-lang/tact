struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
}

contract PartialDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{ a:5 };
    }
}