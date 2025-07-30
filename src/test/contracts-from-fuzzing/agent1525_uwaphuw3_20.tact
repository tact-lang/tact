struct OptCombo {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract MixedNulls {
    s: OptCombo;

    init() {
        self.s = OptCombo{
            x: null,
            y: true
        };
    }
}