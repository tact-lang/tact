struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract StoreDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}