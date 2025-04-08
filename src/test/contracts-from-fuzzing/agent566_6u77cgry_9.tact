struct NestedDefaults {
    x: Int = 7;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultVals {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}