struct HasDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "def";
    d: Int?; // null default implicit
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
