struct ParamDefaults {
    x: Int = 7;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultsTest {
    data: ParamDefaults;

    init() {
        self.data = ParamDefaults{};
    }
}