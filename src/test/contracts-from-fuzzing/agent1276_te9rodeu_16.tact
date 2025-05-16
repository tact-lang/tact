struct SWithDefaults {
    x: Int = 10;
    y: String = "hi";
    z: Bool = false;
}

contract DefaultsInStruct {
    data: SWithDefaults;

    init() {
        self.data = SWithDefaults{};
    }
}