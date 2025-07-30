struct HasDefaults {
    x: Int = 1;
    y: Int = 2;
}

contract UseDefaults {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}