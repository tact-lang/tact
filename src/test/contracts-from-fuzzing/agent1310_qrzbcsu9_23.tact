struct MixDefaults {
    a: Int = 1;
    b: Bool;
    c: Int?;
}

contract MixDefaultsContract {
    data: MixDefaults;
    init() {
        self.data = MixDefaults{
            b: true,
            c: null
        };
    }
}