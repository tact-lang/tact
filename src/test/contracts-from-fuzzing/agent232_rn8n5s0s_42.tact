struct ComplexDefaults {
    aa: Int = 1;
    bb: Bool = true;
    cc: String = "str";
}

contract DeepDefaults {
    deep: ComplexDefaults;

    init() {
        self.deep = ComplexDefaults{};
    }
}