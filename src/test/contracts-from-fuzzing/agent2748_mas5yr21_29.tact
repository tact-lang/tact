struct MultipleDefaults {
    x: Int = 5;
    y: String = "str";
    z: Bool = true;
}

contract StructWithDefaults {
    s: MultipleDefaults;

    init() {
        self.s = MultipleDefaults{};
    }
}