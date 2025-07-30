struct HasDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}