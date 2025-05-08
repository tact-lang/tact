struct MixedDefaults {
    x: Int = 1;
    y: Bool;
    z: String = "hello";
}

contract MixedDefaultsContract {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults{
            y: false
        };
    }
}
