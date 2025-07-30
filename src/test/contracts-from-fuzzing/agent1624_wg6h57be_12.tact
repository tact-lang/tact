struct InnerStruct { val: Int; }

struct ComboOptional {
    optStruct: InnerStruct?;
    optBool: Bool?;
}

contract OptionalCombo {
    data: ComboOptional;

    init() {
        self.data = ComboOptional{
            optStruct: null,
            optBool: null,
        };
    }
}