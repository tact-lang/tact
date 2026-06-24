struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "def";
}

contract DefaultTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
