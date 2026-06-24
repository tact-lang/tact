struct DefaultValues {
    x: Int = 10;
    y: Bool = false;
    z: String = "hello";
}

contract StructWithDefaults {
    field: DefaultValues;

    init() {
        self.field = DefaultValues{};
    }

    receive() {
        self.field.x = 99;
    }
}
