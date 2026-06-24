struct MixDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "default";
    d: Bool;
}

contract StorageMixDefaultsTest {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{
            b: true,
            d: false,
        };
    }
}