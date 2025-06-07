struct MixDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: String?;
}

contract DefaultsTest {
    mix: MixDefaults;

    init() {
        self.mix = MixDefaults{
            d: null,
            e: null
        };
    }
}