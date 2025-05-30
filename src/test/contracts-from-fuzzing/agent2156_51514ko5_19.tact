struct HasDefaults {
    a: Int = 5;
    b: String = "def";
}

contract UseDefaults {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{};
    }
}