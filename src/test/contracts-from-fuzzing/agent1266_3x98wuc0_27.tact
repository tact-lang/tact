struct MixOptDefaults {
    x: Int?;
    y: Int = 10;
    z: Bool?;
    w: String = "x";
}

contract MixedOptDefaults {
    data: MixOptDefaults;
    init() {
        self.data = MixOptDefaults{
            x: null,
            z: null,
        };
    }
}