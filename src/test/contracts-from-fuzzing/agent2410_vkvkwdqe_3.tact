struct OptionDeep {
    name: String = "default";
    value: Int?;
    flag: Bool?;
    embedded: String?;
}

contract OptionalNestedTest {
    data: OptionDeep;

    init() {
        self.data = OptionDeep{
            name: "opt test",
            value: null,
            flag: true,
            embedded: null,
        };
    }
}