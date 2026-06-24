struct ChoiceFlags {
    one: Bool?;
    two: Bool?;
    three: Bool?;
    four: Bool?;
    five: Bool?;
    label: String;
}

contract OptBoolsStruct {
    flags: ChoiceFlags;

    init() {
        self.flags = ChoiceFlags{
            one: null,
            two: true,
            three: null,
            four: false,
            five: null,
            label: "opt bools"
        };
    }
}