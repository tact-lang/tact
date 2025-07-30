struct SDefault {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract StructWithDefaults {
    data: SDefault;

    init() {
        self.data = SDefault{};
    }
}