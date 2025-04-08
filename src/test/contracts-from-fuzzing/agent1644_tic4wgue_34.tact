struct HasDefaults {
    a: Int = 1;
    b: String = "test";
    c: Bool = true;
}

contract TestContract {
    hd: HasDefaults;

    init() {
        self.hd = HasDefaults{};
    }
}