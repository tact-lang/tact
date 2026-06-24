struct MixDefaults {
    a: Int = 5;
    b: Bool;
    c: Bool?;
    d: String = "default";
    e: String?;
}

contract TestContract {
    mixed: MixDefaults;

    init() {
        self.mixed = MixDefaults{
            b: true,
            c: null,
            e: null
        };
    }
}