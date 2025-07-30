struct MultiDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "default";
}

contract TestContract {
    data: MultiDefaults;

    init() {
        self.data = MultiDefaults{};
    }
}