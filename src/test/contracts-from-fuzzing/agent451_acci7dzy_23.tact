struct MixDefaults {
    x: Int = 1;
    y: Bool?;
    z: String = "abc";
}

contract MixedDefaults {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{
            y: null
        };
    }
}