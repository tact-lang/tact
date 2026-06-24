struct MixDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Address? = null;
    e: String = "foo";
    f: Bool? = null;
}

contract DefaultsMixTest {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{};
    }
}
