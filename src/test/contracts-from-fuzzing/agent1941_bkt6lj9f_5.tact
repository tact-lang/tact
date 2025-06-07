struct WithDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "hi";
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}