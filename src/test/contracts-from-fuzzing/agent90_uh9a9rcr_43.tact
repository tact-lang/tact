struct DefaultValues {
    x: Int = 10;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultValuesContract {
    data: DefaultValues;
    init() {
        self.data = DefaultValues{};
    }
}