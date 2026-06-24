struct StructDefaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "default";
}

contract DefaultsInStruct {
    data: StructDefaults;

    init() {
        self.data = StructDefaults{};
    }
}