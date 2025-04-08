struct MixDefaults {
    x: Int = 1;
    y: Bool;
    z: String = "str";
}

contract MixDefaultFields {
    f: MixDefaults;
    init() {
        self.f = MixDefaults{
            y: false
        };
    }
}