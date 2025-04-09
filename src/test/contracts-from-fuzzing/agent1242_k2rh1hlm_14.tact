struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}