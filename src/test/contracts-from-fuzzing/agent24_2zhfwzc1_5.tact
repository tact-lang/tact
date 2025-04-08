struct MixedTypes {
    count: Int;
    toggle: Bool;
    label: String;
    optNum: Int?;
    optFlag: Bool?;
    optText: String?;
}

contract MixedTypesTest {
    info: MixedTypes;

    init() {
        self.info = MixedTypes{
            count: 7,
            toggle: true,
            label: "Mix",
            optNum: null,
            optFlag: false,
            optText: null,
        };
    }
}