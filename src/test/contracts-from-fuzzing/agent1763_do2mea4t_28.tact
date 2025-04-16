struct DefaultValues {
    i: Int = 123;
    b: Bool = true;
    s: String = "default";
}

contract StructWithDefaults {
    val: DefaultValues;

    init() {
        self.val = DefaultValues{};
    }
}