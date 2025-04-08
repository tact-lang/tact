struct MixDefaults {
    i: Int = 10;
    b: Bool;
    s: String = "hello";
}

contract MixedDefaults {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{
            b: true
        };
    }
}