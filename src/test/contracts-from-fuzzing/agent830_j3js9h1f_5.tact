struct HasDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "ok";
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}