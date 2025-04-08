struct OverDefault {
    foo: Int = 3;
}

contract OverrideDefaults {
    x: OverDefault;
    init() {
        self.x = OverDefault{ foo: 100 };
    }
}