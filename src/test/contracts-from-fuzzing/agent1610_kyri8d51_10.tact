struct MixDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: Bool? = false;
    f: String?;
}

contract MixDefaultsTest {
    data: MixDefaults;
    init() {
        self.data = MixDefaults{
            d: null,
            f: "optional default"
        };
    }
}