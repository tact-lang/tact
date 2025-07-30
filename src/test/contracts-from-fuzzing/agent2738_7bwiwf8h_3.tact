struct OptionalDeep {
    value: Int?;
    label: String?;
    flag: Bool?;
    nested: NestedStruct?;
}

struct NestedStruct {
    num: Int;
    text: String;
}

contract OptNested {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            value: null,
            label: null,
            flag: null,
            nested: null
        };
    }
}
