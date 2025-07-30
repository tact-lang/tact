struct DefaultValues {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract StructWithDefaults {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}