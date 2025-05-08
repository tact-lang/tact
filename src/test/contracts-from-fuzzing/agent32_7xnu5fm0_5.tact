struct DefaultValues {
    x: Int = 5;
    y: Bool = true;
    z: String = "test";
}

contract TestContract {
    vals: DefaultValues;

    init() {
        self.vals = DefaultValues{};
    }
}