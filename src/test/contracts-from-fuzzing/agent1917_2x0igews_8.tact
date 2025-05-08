struct DefaultValues {
    x: Int = 42;
    y: Bool = true;
    z: String = "hello";
}

contract StructDefaults {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}