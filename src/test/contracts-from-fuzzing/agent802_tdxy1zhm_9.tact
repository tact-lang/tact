struct OptionalsAndDefaults {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    intWithDefault: Int = 5;
    strWithDefault: String = "default";
}

contract MixOptionalDefaultTest {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            intVal: null,
            boolVal: true,
            strVal: null,
            intWithDefault: 99,
            strWithDefault: "changed",
        };
    }
}