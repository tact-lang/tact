struct HasDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract TestContract {
    hd: HasDefaults;

    init() {
        self.hd = HasDefaults{};
    }
}