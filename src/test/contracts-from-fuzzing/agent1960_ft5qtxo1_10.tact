struct DefaultField {
    x: Int;
    y: String = "default";
    z: Bool = false;
}

contract WithStructDefaults {
    data: DefaultField;

    init() {
        self.data = DefaultField{
            x: 100,
        };
    }
}