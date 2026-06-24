struct ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}

contract TestContract {
    defaults: ZeroDefaults;

    init() {
        self.defaults = ZeroDefaults{};
    }
}